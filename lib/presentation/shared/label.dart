import 'package:kiwi/presentation/shared/responsibility.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Label extends StatelessWidget {
  final String? text;
  final double? size;
  final FontWeight? weight;
  final Color? color;
  final TextAlign? align;
  final TextDecoration? decoration;
  final String? fontFamily;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontStyle? fontStyle;
  final double? latterSpacing;

  const Label({
    super.key,
    this.text,
    this.maxLines,
    this.overflow,
    this.size,
    this.weight,
    this.color,
    this.align,
    this.decoration,
    this.fontFamily,
    this.latterSpacing,
    this.fontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: ResponsiveValue(
          context,
          defaultValue: size ?? (context.isTablet ? 22 : 14),
          conditionalValues: [
            const Condition.equals(name: TABLET, value: 24.0),
          ],
        ).value,
        fontFamily: fontFamily,
        fontWeight: weight,
        color: color,
        letterSpacing: latterSpacing ?? 0.3,
        decoration: decoration,
        fontStyle: fontStyle ?? FontStyle.normal,
      ),
    );
  }
}
