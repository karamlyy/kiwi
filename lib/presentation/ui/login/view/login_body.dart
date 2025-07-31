import 'package:kiwi/presentation/shared/size.dart';
import 'package:kiwi/presentation/ui/login/view/login_button.dart';
import 'package:kiwi/presentation/ui/login/view/login_field.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 3),
        40.h,
        const LoginField(),
        const Spacer(flex: 4),
        const LoginButton(),
        const Spacer(flex: 2),
      ],
    );
  }
}
