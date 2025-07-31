import 'package:flutter/foundation.dart';
import 'package:kiwi/app/cubit/app_cubit.dart';
import 'package:kiwi/app/cubit/app_state.dart';
import 'package:kiwi/app/generic/generic_consumer.dart';
import 'package:kiwi/app/generic/generic_state.dart';
import 'package:kiwi/presentation/router/navigation.dart';
import 'package:kiwi/presentation/router/route_generator.dart';
import 'package:kiwi/presentation/shared/ui_theme.dart';
import 'package:kiwi/presentation/ui/login/view/login_page.dart';
import 'package:kiwi/presentation/ui/main/view/main_page.dart';
import 'package:kiwi/presentation/ui/passcode/cubit/passcode_cubit.dart';
import 'package:kiwi/presentation/ui/passcode/view/passcode_page.dart';
import 'package:kiwi/presentation/ui/splash/view/splash_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
      child: MaterialApp(
        title: "Kiwi",
        theme: UITheme.appTheme,
        navigatorKey: Navigation.navigatorKey,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        onGenerateRoute: RouteGenerator.generateRoute,
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
        ),
        home: GenericConsumer<AppCubit, GenericState>(
          builder: (context, state) {
            return page(state, context);
          },
          listener: (context, state) {
            if (state is Failure) {
              if (kDebugMode) {
                print(state.error);
              }
            }
          },
        ),
      ),
    );
  }
}

page(GenericState state, BuildContext context) {
  if (state is Authorized) {
    return const MainPage();
  } else if (state is Pin) {
    return const PasscodePage(passCodeState: PassCodeState.confirm);
  } else if (state is Unauthorized) {
    return const LoginPage(isLogin: false);
  } else if (state is SplashScreen) {
    return const SplashPage();
  }
  return const SplashPage();
}
