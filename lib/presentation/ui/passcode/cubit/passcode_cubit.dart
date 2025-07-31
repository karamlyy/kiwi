import 'package:kiwi/app/generic/generic_state.dart';
import 'package:kiwi/app/view/di.dart';
import 'package:kiwi/data/exception/error.dart';
import 'package:kiwi/data/service/preferences/preferences.dart';
import 'package:kiwi/presentation/manager/biometric/biometric_manager.dart';
import 'package:kiwi/presentation/shared/shared.dart';
import 'package:kiwi/presentation/ui/passcode/cubit/passcode_state.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';

enum PassCodeState { set, confirm, change }

class PassCodeArgs {
  final PassCodeState passCodeState;
  final bool userHasPin;
  PassCodeArgs({required this.passCodeState, required this.userHasPin});
}

class PasscodeCubit extends Cubit<GenericState> {
  bool _showBiometricsIcon = false;

  PassCodeState passCodeState;
  PasscodeCubit({required this.passCodeState}) : super(Initial()) {
    check();
  }

  int _pinTry = 0;

  final _biometricManager = locator.get<BiometricManager>();

  bool get showBiometricsIcon => _showBiometricsIcon;

  check() async {
    final prefs = await PreferencesService.instance;
    _showBiometricsIcon = await biometricIsAvailable();
    emit(
      Success<PassCodeArgs>(
        value: PassCodeArgs(
          passCodeState: passCodeState,
          userHasPin: prefs.hasPin,
        ),
      ),
    );
    if (prefs.isBiometricsEnabled && passCodeState != PassCodeState.change) await authenticate();
  }

  Future<bool> checkOldPin(String pin) async {
    final prefs = await PreferencesService.instance;
    final storedPin = prefs.pin;
    if (pin == storedPin) {
      emit(InProgress());
      passCodeState = PassCodeState.set;
      await prefs.clearPin();
      await prefs.toggleBiometrics(false);
      check();
      return true;
    } else {
      error(value: L10n.passcodeError);
      return false;
    }
  }

  Future<bool> biometricIsAvailable() async {
    final isBiometricSupported = await _biometricManager.isDeviceSupported();
    final isBiometricAvailable = await _biometricManager.isBiometricAvailable();
    final List<BiometricType> availableBiometrics = await _biometricManager.availableBiometrics();

    return isBiometricSupported && isBiometricAvailable && availableBiometrics.isNotEmpty;
  }

  authenticate() async {
    try {
      final canAuthBiometrics = await biometricIsAvailable();

      if (canAuthBiometrics) {
        final didAuthenticate = await _biometricManager.authenticate();
        final prefs = await PreferencesService.instance;
        await prefs.toggleBiometrics(true);
        if (didAuthenticate && passCodeState != PassCodeState.change) {
          prefs.askPin(true);
          emit(PinMatched());
        }
      }
    } on PlatformException catch (e) {
      error(value: e.message);
    }
  }

  askBiometric() async {
    if (passCodeState == PassCodeState.change) {
      emit(PinMatched());
    } else {
      emit(AskBiometric());

      await check();
    }
  }

  save(String pin) async {
    emit(InProgress());
    final prefs = await PreferencesService.instance;
    await prefs.setPin(pin);
    await prefs.askPin(true);
    await prefs.setAuthorizationPassed(true);
    await prefs.setOptionLater(false);
    await check();

    final List<BiometricType> availableBiometrics = await _biometricManager.availableBiometrics();
    final isBiometricSupported = await _biometricManager.isDeviceSupported();
    final isBiometricAvailable = await _biometricManager.isBiometricAvailable();
    final canAuthBiometrics = availableBiometrics.isNotEmpty && isBiometricAvailable && isBiometricSupported;
    if (canAuthBiometrics) {
      await askBiometric();
    } else {
      emit(PinMatched());
    }
  }

  validatePin(String pin) async {
    emit(InProgress());
    final prefs = await PreferencesService.instance;
    final storedPin = prefs.pin;

    if (pin == storedPin) {
      await prefs.askPin(true);
      emit(PinMatched());
    } else {
      _pinTry += 1;
      if (_pinTry == 3) {
        clear();
      } else {
        error(value: L10n.passcodeError);
      }
    }
  }

  error({String? value}) async {
    final message = value ?? L10n.passcodeError;
    emit(Failure(ErrorMessage(message: message)));
    await check();
  }

  clear() async {
    emit(InProgress());
    final prefs = await PreferencesService.instance;
    await prefs.clear();
    await prefs.setAuthorizationPassed(false);
    emit(ClearUserData());
  }
}
