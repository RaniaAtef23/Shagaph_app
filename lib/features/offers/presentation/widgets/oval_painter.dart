import 'package:flutter/material.dart';

class OvalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Paint for the fill (white)
    final fillPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Paint for the border (orange)
    final borderPaint = Paint()
      ..color = const Color(0xFFF04C29)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1; // Adjust the stroke width as needed

    // Draw first oval with white fill
    final oval1 = Rect.fromLTWH(-50, size.height / 4, 70, 15);
    canvas.drawOval(oval1, fillPaint);

    // Draw first oval border
    canvas.drawOval(oval1, borderPaint);

    // Draw second oval with white fill
    final oval2 = Rect.fromLTWH(size.width - 20, size.height / 4, 70, 15);
    canvas.drawOval(oval2, fillPaint);

    // Draw second oval border
    canvas.drawOval(oval2, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
