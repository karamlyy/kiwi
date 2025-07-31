import 'package:kiwi/app/generic/generic_state.dart';
import 'package:kiwi/app/view/di.dart';
import 'package:kiwi/data/endpoint/auth/login_endpoint.dart';
import 'package:kiwi/data/exception/error.dart';
import 'package:kiwi/data/repository/auth_repository.dart';
import 'package:kiwi/data/service/preferences/preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<GenericState> {
  LoginCubit() : super(Initial());

  final _authRepository = locator.get<AuthRepository>();

  login(LoginInput input) async {
    emit(InProgress());
    final prefs = await PreferencesService.instance;
    final result = await _authRepository.login(input);
    result.fold(
      (l) => emit(Failure(ErrorMessage(message: l.error.message))),
      (r) {
        prefs.setAuthorizationPassed(true);
        prefs.setAccessToken(r.token ?? "");
        prefs.setRefreshToken(r.refreshToken ?? "");
        prefs.setName(r.user?.name ?? "");
        prefs.setUserId(r.user?.id ?? 0);
        emit(Success());
      },
    );
  }
}
