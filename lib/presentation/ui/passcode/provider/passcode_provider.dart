import 'package:kiwi/presentation/components/number-pad/model/number_pad_char_item.dart';
import 'package:kiwi/presentation/shared/shared.dart';
import 'package:kiwi/presentation/shared/string_x.dart';
import 'package:kiwi/presentation/ui/passcode/cubit/passcode_cubit.dart';
import 'package:flutter/cupertino.dart';

class PasscodeProvider extends ChangeNotifier {
  final int pinCount;
  bool _userHasPin;
  PassCodeState? _passCodeState;

  PasscodeProvider(
    this._userHasPin,
    this._passCodeState, {
    this.pinCount = 4,
  });

  String _pin = '';
  String _confirmationPin = '';
  bool _isPinReady = false;
  bool _hasPinMatch = false;
  bool _pinError = false;
  int _pinTry = 0;
  bool _checkOldPin = false;

  bool get hasError => pinError != null;
  bool get hasFirstStepCompleted => _confirmationPin.isNotEmpty;
  bool get userHasPin => _userHasPin;
  String get pin => _pin;
  bool get checkOldPin => _checkOldPin;
  PassCodeState? get passCodeState => _passCodeState;

  updatePassCodeState(PassCodeState passCodeState) {
    _passCodeState = passCodeState;
    notifyListeners();
  }

  set checkOldPin(bool value) {
    _checkOldPin = value;
    notifyListeners();
  }

  String get passcodeText {
    if (passCodeState == PassCodeState.change) {
      return L10n.enterOldPin;
    } else if (passCodeState == PassCodeState.set && !_userHasPin && hasFirstStepCompleted) {
      return L10n.againPin;
    } else if (passCodeState == PassCodeState.set && !_userHasPin && !hasFirstStepCompleted) {
      return L10n.setNewPin;
    } else if (passCodeState == PassCodeState.confirm && hasFirstStepCompleted) {
      return L10n.againPin;
    } else if (_userHasPin) {
      return L10n.enterPin;
    }
    return L10n.setPin;
  }

  String? get pinError {
    if (_pinError && !_hasPinMatch) {
      return L10n.pinDoesNotMatch;
    }

    return null;
  }

  set pin(String value) {
    _pin = value;
    notifyListeners();
  }

  set userHasPin(bool value) {
    _userHasPin = value;
    notifyListeners();
  }

  bool get savePin {
    return !_userHasPin && _hasPinMatch && !_pinError;
  }

  bool get didPinFailThreeTimes {
    return _pinTry == 3;
  }

  bool get validatePin {
    return _userHasPin && _isPinReady;
  }

  updatePin(PinItem pinItem) {
    if (pinItem.pin == KeywordNumber.biometric) {
      return;
    }
    if (pinItem.pin == KeywordNumber.clear) {
      if (_pin.isNotEmpty) {
        _pin = _pin.lastRemoved;
        _pinError = false;
        _isPinReady = false;
      }
    } else {
      if (pin.length < pinCount) {
        _pin += pinItem.value;
        if (pin.length == pinCount) _isPinReady = true;
        if (_isPinReady) {
          if (passCodeState == PassCodeState.change) {
            _checkOldPin = true;
            _isPinReady = false;
          } else {
            if (!_userHasPin) {
              if (_confirmationPin.isEmpty) {
                _confirmationPin = _pin;
                _pin = '';
                _isPinReady = false;
              } else {
                if (_pin == _confirmationPin) {
                  _hasPinMatch = true;
                  _pinError = false;
                } else {
                  _hasPinMatch = false;
                  _pinError = true;
                }
              }
            }
          }
        }
      }
    }
    notifyListeners();
  }

  clear() {
    _pin = '';
    _pinError = false;
    _hasPinMatch = false;
    _isPinReady = false;
    _pinTry += 1;
    notifyListeners();
  }
}
