import 'package:kiwi/presentation/components/number-pad/model/number_pad_char_item.dart';
import 'package:kiwi/presentation/components/number-pad/view/number_pad.dart';
import 'package:kiwi/presentation/ui/passcode/cubit/passcode_cubit.dart';
import 'package:kiwi/presentation/ui/passcode/provider/passcode_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasscodeNumberPad extends StatelessWidget {
  const PasscodeNumberPad({super.key});

  @override
  Widget build(BuildContext context) {
    final passcodeProvider = context.watch<PasscodeProvider>();
    final passcodeCubit = context.read<PasscodeCubit>();
    return NumberPad(
      isVisible: passcodeCubit.showBiometricsIcon && (passcodeProvider.passCodeState == PassCodeState.change ? false : passcodeProvider.userHasPin),
      onTapNumber: (value) async {
        passcodeProvider.updatePin(value);
        if (value.pin == KeywordNumber.biometric) {
          await context.read<PasscodeCubit>().authenticate();
        }
        if (passcodeProvider.passCodeState == PassCodeState.change) {
          if (passcodeProvider.checkOldPin) {
            final result = await passcodeCubit.checkOldPin(passcodeProvider.pin);
            passcodeProvider.checkOldPin = false;

            if (result) {
              passcodeProvider.updatePassCodeState(PassCodeState.set);
              passcodeProvider.pin = '';
              passcodeProvider.userHasPin = false;
            }
          }
        } else {
          if (passcodeProvider.validatePin) {
            passcodeCubit.validatePin(passcodeProvider.pin);
          }
          if (passcodeProvider.savePin) {
            passcodeCubit.save(passcodeProvider.pin);
          }
          if (passcodeProvider.hasError) {
            passcodeCubit.error(value: passcodeProvider.pinError);
          }
        }
      },
    );
  }
}
