enum KeywordNumber {
  zero("0"),
  one("1"),
  two("2"),
  three("3"),
  four("4"),
  five("5"),
  six("6"),
  seven("7"),
  eight("8"),
  nine("9"),
  biometric("-1"),
  clear("-2");

  const KeywordNumber(this.data);
  final String data;
}

class PinItem {
  final KeywordNumber pin;

  PinItem(this.pin);

  String get value {
    return pin.data;
  }
}
