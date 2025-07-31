import 'package:kiwi/presentation/shared/img.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double? scale;
  final Axis? axis;

  const Logo({super.key, this.scale = 3, this.axis = Axis.vertical});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Img.logo2,
      scale: scale,
      fit: BoxFit.contain,
    );
  }
}
