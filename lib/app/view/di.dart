import 'package:kiwi/data/repository/auth_repository.dart';

import 'package:kiwi/data/service/api/api.dart';
import 'package:kiwi/presentation/components/helper/date_picker_helper.dart';
import 'package:kiwi/presentation/manager/biometric/biometric_manager.dart';
import 'package:kiwi/presentation/shared/shared.dart';
import 'package:kiwi/presentation/utils/share_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:local_auth/local_auth.dart';

GetIt locator = GetIt.instance;

class Injector {
  static register() async {
    await _registerRepositories();
    await _registerComponents();
    await _registerServices();
  }

  static _registerServices() {
    locator.registerSingleton<ApiService>(ApiService());
    locator.registerSingleton<BiometricManager>(BiometricManager(LocalAuthentication()));
    locator.registerSingleton<UIRefreshController>(UIRefreshController());
  }

  static _registerComponents() {
    locator.registerFactory<ShareManager>(() => ShareManager());
    locator.registerFactory<DatePickerHelper>(() => DatePickerHelper());
  }

  static _registerRepositories() {
    locator.registerFactory<AuthRepository>(() => AuthRepositoryImpl(locator.get()));
  }
}
