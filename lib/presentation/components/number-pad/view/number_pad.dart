import 'package:kiwi/presentation/components/button/number_button.dart';
import 'package:kiwi/presentation/components/number-pad/model/number_pad_char_item.dart';
import 'package:kiwi/presentation/components/number-pad/provider/number_pad_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NumberPad extends StatelessWidget {
  final Function(PinItem) onTapNumber;
  final bool? isVisible;

  const NumberPad({
    super.key,
    required this.onTapNumber,
    this.isVisible,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NumberPadProvider(),
      child: Consumer<NumberPadProvider>(
        builder: (context, provider, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: provider.numberPadCharacters.map((rows) {
              return Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: rows.map((char) {
                    return NumberButton(
                      isVisible: isVisible,
                      char: char.pin,
                      pinTitle: char.value,
                      onTap: () => onTapNumber(char),
                    );
                  }).toList(),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
