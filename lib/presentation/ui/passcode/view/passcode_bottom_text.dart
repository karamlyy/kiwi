import 'package:kiwi/presentation/components/bottom-sheet/primary_bottom_sheet.dart';
import 'package:kiwi/presentation/components/button/primary_button.dart';
import 'package:kiwi/presentation/components/text/text_rich.dart';
import 'package:kiwi/presentation/router/navigation.dart';
import 'package:kiwi/presentation/shared/shared.dart';
import 'package:kiwi/presentation/ui/passcode/cubit/passcode_cubit.dart';
import 'package:kiwi/presentation/ui/passcode/provider/passcode_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PasscodeBottomText extends StatelessWidget {
  const PasscodeBottomText({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PasscodeProvider>();
    final passcodeCubit = context.read<PasscodeCubit>();
    if (!provider.userHasPin) {
      return const SizedBox.shrink();
    }
    return TextRich(
      text1: "Giriş ",
      text2: "kodunuzu unutmusunuz?",
      color1: UIColor.black,
      didTap: () {
        PrimaryBottomSheet.show(
          context,
          text: "Giriş kodunuzu sıfırlamaq istədiyinizdən əminsiniz?",
          buttons: [
            PrimaryButton(
              title: L10n.yes,
              onTap: () async {
                passcodeCubit.clear();
                Navigation.pop();
              },
            ),
            PrimaryButton(
              hasBorder: true,
              title: L10n.no,
              onTap: () => Navigation.pop(),
            ),
          ],
        );
      },
    );
  }
}
