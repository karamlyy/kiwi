import 'package:kiwi/presentation/shared/shared.dart';
import 'package:kiwi/presentation/ui/passcode/provider/passcode_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PassCodeText extends StatelessWidget {
  const PassCodeText({super.key});

  @override
  Widget build(BuildContext context) {
    final passcodeProvider = context.watch<PasscodeProvider>();
    return Label(
      text: passcodeProvider.passcodeText,
      size: 16,
    );
  }
}
