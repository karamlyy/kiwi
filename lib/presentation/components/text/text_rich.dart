import 'package:kiwi/presentation/shared/shared.dart';
import 'package:flutter/cupertino.dart';

class TextRich extends StatelessWidget {
  final String? text1;
  final String? text2;
  final String? text3;
  final Color? color1;
  final Color? color2;
  final TextStyle? text1Style;
  final TextStyle? text2Style;
  final TextStyle? text3Style;
  final VoidCallback? didTap;
  const TextRich({
    super.key,
    this.text1,
    this.text2,
    this.color1,
    this.color2,
    this.text1Style,
    this.text2Style,
    this.didTap,
    this.text3,
    this.text3Style,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: didTap,
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          children: [
            TextSpan(
              text: text1,
              style: text1Style ?? TextStyle(fontSize: 15, color: color1 ?? UIColor.black),
            ),
            TextSpan(
              text: text2,
              style: text2Style ?? TextStyle(fontSize: 15, color: color2 ?? UIColor.black),
            ),
            TextSpan(
              text: text3,
              style: text3Style ?? TextStyle(fontSize: 15, color: color2 ?? UIColor.black),
            ),
          ],
        ),
      ),
    );
  }
}
