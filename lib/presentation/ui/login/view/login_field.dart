import 'package:kiwi/presentation/components/field/primary_text_field.dart';
import 'package:kiwi/presentation/shared/color.dart';
import 'package:kiwi/presentation/shared/img.dart';
import 'package:kiwi/presentation/shared/l10n.dart';
import 'package:kiwi/presentation/ui/login/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginField extends StatelessWidget {
  const LoginField({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = context.watch<LoginProvider>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          PrimaryTextField(
            headText: L10n.userName,
            hintText: L10n.enterNameSurname,
            onTextChanged: loginProvider.updateUserName,
            error: loginProvider.userNameError,
            prefix: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Image.asset(
                Img.profile,
                width: 12,
                height: 12,
              ),
            ),
          ),
          PrimaryTextField(
            isObscure: !loginProvider.isObscure,
            suffix: GestureDetector(
              onTap: () => loginProvider.changeObscure(),
              child: Icon(
                loginProvider.isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                size: 24,
                color: UIColor.grey,
              ),
            ),
            onTextChanged: loginProvider.updatePassword,
            error: loginProvider.passwordError,
            headText: L10n.pass,
            hintText: L10n.enterPass,
            prefix: Image.asset(
              Img.key,
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }
}
