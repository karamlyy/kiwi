import 'dart:io';

import 'package:kiwi/app/cubit/app_cubit.dart';
import 'package:kiwi/app/generic/generic_consumer.dart';
import 'package:kiwi/app/generic/generic_state.dart';
import 'package:kiwi/presentation/components/bottom-sheet/primary_bottom_sheet.dart';
import 'package:kiwi/presentation/components/button/primary_button.dart';
import 'package:kiwi/presentation/router/navigation.dart';
import 'package:kiwi/presentation/shared/shared.dart';
import 'package:kiwi/presentation/ui/passcode/cubit/passcode_cubit.dart';
import 'package:kiwi/presentation/ui/passcode/cubit/passcode_state.dart';
import 'package:kiwi/presentation/ui/passcode/provider/passcode_provider.dart';
import 'package:kiwi/presentation/ui/passcode/view/passcode_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class PasscodePage extends StatelessWidget {
  final bool? isDialog;
  final PassCodeState passCodeState;
  const PasscodePage({
    super.key,
    this.isDialog,
    required this.passCodeState,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: isDialog == true || passCodeState == PassCodeState.change ? false : true,
      child: Scaffold(
        backgroundColor: UIColor.white,
        body: BlocProvider(
          create: (_) => PasscodeCubit(passCodeState: passCodeState),
          child: GenericConsumer<PasscodeCubit, GenericState>(
            listener: (_, state) async {
              if (state is PinMatched || state is ClearUserData) {
                //Navigation.popToRoot();
                Navigation.pushNamedAndRemoveUntil(RouteName.main);
                context.read<AppCubit>().check();
              } else if (state is AskBiometric && passCodeState != PassCodeState.change) {
                await PrimaryBottomSheet.show(
                  context,
                  didTap: () {
                    Navigation.pushNamedAndRemoveUntil(RouteName.main);
                    context.read<AppCubit>().check();
                  },
                  text: Platform.isIOS ? L10n.enterFaceId : L10n.enterFingerprint,
                  buttons: [
                    PrimaryButton(
                      title: L10n.activate,
                      onTap: () async => await context.read<PasscodeCubit>().authenticate(),
                    ),
                    PrimaryButton(
                      hasBorder: true,
                      title: L10n.skip,
                      onTap: () {
                        Navigation.popToRoot();
                        context.read<AppCubit>().check();
                      },
                    ),
                  ],
                );
              }
            },
            builder: (_, state) {
              if (state is Success<PassCodeArgs>) {
                return ChangeNotifierProvider(
                  create: (_) => PasscodeProvider(
                    state.value?.userHasPin ?? false,
                    state.value?.passCodeState ?? PassCodeState.set,
                  ),
                  child: const PasscodeBody(),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
