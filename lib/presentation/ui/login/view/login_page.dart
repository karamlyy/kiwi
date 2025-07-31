import 'package:kiwi/app/generic/generic_listener.dart';
import 'package:kiwi/app/generic/generic_state.dart';
import 'package:kiwi/presentation/router/navigation.dart';
import 'package:kiwi/presentation/ui/login/cubit/login_cubit.dart';
import 'package:kiwi/presentation/ui/login/provider/login_provider.dart';
import 'package:kiwi/presentation/ui/login/view/login_body.dart';
import 'package:kiwi/presentation/ui/passcode/cubit/passcode_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final bool isLogin;
  const LoginPage({super.key, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: PopScope(
        canPop: isLogin,
        child: Scaffold(
          appBar: null,
          body: GenericListener<LoginCubit, GenericState>(
            listener: (context, state) {
              if (state is Success) {
                Navigation.push(RouteName.passcode, arguments: PassCodeState.set);
              }
            },
            child: ChangeNotifierProvider(
              create: (_) => LoginProvider(),
              child: const LoginBody(),
            ),
          ),
        ),
      ),
    );
  }
}
