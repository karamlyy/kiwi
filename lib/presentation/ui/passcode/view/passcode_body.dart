import 'package:kiwi/presentation/ui/passcode/view/passcode_bottom_text.dart';
import 'package:kiwi/presentation/ui/passcode/view/passcode_number_pad.dart';
import 'package:kiwi/presentation/ui/passcode/view/passcode_pin_field.dart';
import 'package:kiwi/presentation/ui/passcode/view/passcode_text.dart';
import 'package:flutter/material.dart';

class PasscodeBody extends StatelessWidget {
  const PasscodeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 36),
              SizedBox(height: 26),
              PassCodeText(),
              SizedBox(height: 36),
              PasscodePinField(),
              SizedBox(height: 36),
              Expanded(child: PasscodeNumberPad()),
              SizedBox(height: 12),
              PasscodeBottomText(),
            ],
          ),
        ),
      ),
    );
  }
}
