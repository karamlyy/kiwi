import 'package:kiwi/presentation/shared/color.dart';
import 'package:flutter/material.dart';

class DashLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 8.0, dashSpace = 8.0, startX = 0;
    final paint = Paint()
      ..color = UIColor.grey
      ..strokeWidth = 1;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
