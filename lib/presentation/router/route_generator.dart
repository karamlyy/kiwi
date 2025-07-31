import 'dart:io';

import 'package:kiwi/presentation/components/appbar/primary_app_bar.dart';
import 'package:kiwi/presentation/router/navigation.dart';
import 'package:kiwi/presentation/shared/label.dart';
import 'package:kiwi/presentation/shared/size.dart';
import 'package:kiwi/presentation/ui/login/view/login_page.dart';
import 'package:kiwi/presentation/ui/main/view/main_page.dart';
import 'package:kiwi/presentation/ui/passcode/cubit/passcode_cubit.dart';
import 'package:kiwi/presentation/ui/passcode/view/passcode_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final route = RouteName.fromString(settings.name);
    final args = settings.arguments;

    if (kDebugMode) {
      print("Navigating to :> [$route] ; Arguments are :> [$args]");
    }

    switch (route) {
      case RouteName.main:
        return _push(const MainPage());
      case RouteName.login:
        final isExpired = args as bool;
        return _push(LoginPage(isLogin: isExpired));
      case RouteName.passcode:
        final passcodeType = args as PassCodeState;
        return _push(PasscodePage(passCodeState: passcodeType));

      case RouteName.none:
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static PageRoute _push(Widget widget) {
    return Platform.isIOS
        ? CupertinoPageRoute(builder: (_) => widget)
        : PageRouteBuilder(
            pageBuilder: (_, __, ___) => widget,
            transitionDuration: const Duration(milliseconds: 500),
            reverseTransitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder: (_, animation, secondaryAnimation, child) {
              const curve = Curves.easeInOut;
              final curvedAnimation = CurvedAnimation(
                parent: animation,
                curve: curve,
              );

              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(curvedAnimation),
                child: child,
              );
            },
          );
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: PrimaryAppBar(context),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(CupertinoIcons.time, size: 30),
              8.h,
              const Center(
                child: Label(
                  size: 18,
                  text: "Coming Soon",
                  align: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
