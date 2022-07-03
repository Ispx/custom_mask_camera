import 'package:flutter/material.dart';
import 'dart:math' as math;

class CircleMaskPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withOpacity(.8)
      ..style = PaintingStyle.fill;
    final backgroundPath = Path()..addRect(Offset.zero & size);
    final backgroundCiclePath = Path()
      ..addArc(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          height: size.width * .75,
          width: size.width * .75,
        ),
        0,
        math.pi * 2,
      );
    final compinePath = Path.combine(
        PathOperation.difference, backgroundPath, backgroundCiclePath);

    canvas.drawPath(compinePath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
