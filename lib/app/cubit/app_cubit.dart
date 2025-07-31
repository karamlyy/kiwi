import 'package:kiwi/app/cubit/app_state.dart';
import 'package:kiwi/app/generic/generic_state.dart';
import 'package:kiwi/data/exception/error.dart';
import 'package:kiwi/data/service/preferences/preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<GenericState> {
  AppCubit() : super(Initial()) {
    check();
  }

  bool _isDialogOpen = false;
  bool get isDialogOpen => _isDialogOpen;

  toggleDialog(bool isOpen) {
    _isDialogOpen = isOpen;
  }

  check() async {
    emit(SplashScreen());
    final prefs = await PreferencesService.instance;

    try {
      if (!prefs.wasAuthorizationPassed) {
        emit(Unauthorized());
        return;
      }

      if (prefs.wasPinPassed) {
        await prefs.askPin(false);
        emit(Authorized());
      } else {
        emit(Pin());
      }
    } on HttpException {
      await prefs.clear();
      emit(Unauthorized());
    }
  }
}
