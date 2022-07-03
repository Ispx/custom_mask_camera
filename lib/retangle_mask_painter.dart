import 'package:flutter/material.dart';

class RetangleMaskPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.black.withOpacity(.8);

    final backgroundPath = Path()..addRect(Offset.zero & size);
    double left = size.width * .1;
    double right = size.width * .90;
    double top = size.height * .20;
    double bottom = size.height * .7;
    double padding = 8;
    double lineSize = 30;
    final backgroundRectanglePath = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTRB(
            left,
            top,
            right,
            bottom,
          ),
          const Radius.circular(20),
        ),
      );
    final compinePath = Path.combine(
        PathOperation.difference, backgroundPath, backgroundRectanglePath);
    canvas.drawPath(compinePath, paint);

    final scanMarkPaint = Paint()
      ..color = Colors.green
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    final scanMarkPath = Path();

    //top-left
    scanMarkPath
      ..moveTo(
        left - padding,
        top + lineSize,
      )
      ..lineTo(
        left - padding,
        top - padding,
      )
      ..lineTo(
        left + lineSize,
        top - padding,
      );

    //bottom-left
    scanMarkPath
      ..moveTo(
        left - padding,
        bottom - lineSize,
      )
      ..lineTo(
        left - padding,
        bottom + padding,
      )
      ..lineTo(
        left + lineSize,
        bottom + padding,
      );

    //top-right
    scanMarkPath
      ..moveTo(
        right + padding,
        top + lineSize,
      )
      ..lineTo(
        right + padding,
        top - padding,
      )
      ..lineTo(
        right - lineSize,
        top - padding,
      );
    //bottom-right
    scanMarkPath
      ..moveTo(
        right + padding,
        bottom - lineSize,
      )
      ..lineTo(
        right + padding,
        bottom + padding,
      )
      ..lineTo(
        right - lineSize,
        bottom + padding,
      );
    canvas.drawPath(scanMarkPath, scanMarkPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
