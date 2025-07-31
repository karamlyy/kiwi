import 'package:kiwi/presentation/shared/color.dart';
import 'package:kiwi/presentation/shared/label.dart';
import 'package:kiwi/presentation/shared/responsibility.dart';
import 'package:kiwi/presentation/shared/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PrimaryBottomNavigationBarItem extends StatelessWidget {
  final String icon;
  final double? height;
  final String text;
  final Color? color;
  final double? textSize;
  final bool isActive;
  final int? index;
  const PrimaryBottomNavigationBarItem({
    super.key,
    required this.icon,
    this.height,
    required this.text,
    this.color,
    this.textSize,
    this.isActive = false,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          icon,
          color: color,
          height: height ?? (context.isTablet ? 32 : 26),
        ),
        6.h,
        Label(
          text: text,
          size: textSize,
          color: isActive ? UIColor.primary : UIColor.grey,
          weight: isActive ? FontWeight.bold : FontWeight.w400,
        ),
        6.h,
      ],
    );
  }
}
