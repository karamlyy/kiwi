import 'package:kiwi/app/generic/generic_state.dart';
import 'package:kiwi/presentation/components/field/pin_field.dart';
import 'package:kiwi/presentation/ui/passcode/cubit/passcode_cubit.dart';
import 'package:kiwi/presentation/ui/passcode/provider/passcode_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasscodePinField extends StatelessWidget {
  const PasscodePinField({super.key});

  @override
  Widget build(BuildContext context) {
    final passcodeProvider = context.watch<PasscodeProvider>();
    return BlocListener<PasscodeCubit, GenericState>(
      listener: (context, state) {
        if (state is Failure) passcodeProvider.clear();
      },
      child: PinField(
        error: passcodeProvider.pinError,
        isObscure: true,
        maxNumberOfFields: 4,
        pin: passcodeProvider.pin,
      ),
    );
  }
}
