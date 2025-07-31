import 'package:kiwi/presentation/components/number-pad/model/number_pad_char_item.dart';
import 'package:flutter/material.dart';

class NumberPadProvider extends ChangeNotifier {
  final List<List<PinItem>> _numberPadCharacters = [
    [PinItem(KeywordNumber.one), PinItem(KeywordNumber.two), PinItem(KeywordNumber.three)],
    [PinItem(KeywordNumber.four), PinItem(KeywordNumber.five), PinItem(KeywordNumber.six)],
    [PinItem(KeywordNumber.seven), PinItem(KeywordNumber.eight), PinItem(KeywordNumber.nine)],
    [PinItem(KeywordNumber.biometric), PinItem(KeywordNumber.zero), PinItem(KeywordNumber.clear)],
  ];

  List<List<PinItem>> get numberPadCharacters => _numberPadCharacters;
}
