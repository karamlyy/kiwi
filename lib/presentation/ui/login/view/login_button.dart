import 'package:kiwi/app/generic/generic_builder.dart';
import 'package:kiwi/app/generic/generic_state.dart';
import 'package:kiwi/presentation/components/button/primary_button.dart';
import 'package:kiwi/presentation/shared/l10n.dart';
import 'package:kiwi/presentation/ui/login/cubit/login_cubit.dart';
import 'package:kiwi/presentation/ui/login/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = context.watch<LoginProvider>();
    final loginCubit = context.read<LoginCubit>();

    return GenericBuilder<LoginCubit, GenericState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: PrimaryButton(
            title: L10n.login,
            onTap: loginProvider.isFormValid ? () => loginCubit.login(loginProvider.input) : null,
          ),
        );
      },
    );
  }
}
