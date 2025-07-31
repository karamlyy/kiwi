import 'package:kiwi/app/cubit/app_cubit.dart';
import 'package:kiwi/app/view/app.dart';
import 'package:kiwi/app/view/delegate.dart';
import 'package:kiwi/app/view/di.dart';
import 'package:kiwi/data/service/preferences/preferences.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'presentation/ui/main/provider/main_provider.dart';

void main() async {
  await Injector.register();
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runner();
}

runner() async {
  final prefs = await PreferencesService.instance;
  final savedLanguageCode = prefs.appLanguage ?? 'az';
  Bloc.observer = SimpleBlocObserver();
  runApp(
    EasyLocalization(
      saveLocale: true,
      startLocale: Locale(savedLanguageCode),
      path: "assets/translations",
      supportedLocales: const [
        Locale("az"),
        Locale("en"),
        Locale("ru"),
      ],
      fallbackLocale: const Locale("az"),
      child: MultiProvider(
        providers: [
          BlocProvider(
            create: (_) => AppCubit(),
          ),
          ChangeNotifierProvider(
            create: (_) => MainProvider(),
          ),
        ],
        child: const App(),
      ),
    ),
  );
}
