import 'package:flutter/material.dart';

class HorizontalArrow extends CustomPainter {
  const HorizontalArrow();

  @override
  void paint(Canvas canvas, Size size) {
    Path bezierPath = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, size.height * 0.8)
      ..quadraticBezierTo(
        size.width / 2,
        size.height * 0.6,
        size.width,
        size.height * 0.8,
      )
      ..lineTo(size.width, size.height);

    final bezierPaint = Paint()
      ..shader =
          LinearGradient(colors: [Colors.purple[400]!, Colors.teal[400]!])
              .createShader(Offset(0, size.height * 0.8) & size);

    canvas.drawPath(bezierPath, bezierPaint);
  }

  @override
  bool shouldRepaint(HorizontalArrow oldDelegate) => false;
}

class ArrowConfig {
  final Size size;
  final double bend;
  final bool topToBottom;

  ArrowConfig({required this.size, this.bend = 0.5, this.topToBottom = false});

  Offset get point1 => Offset(0, topToBottom ? 0 : size.height);
  Offset get anchor1 =>
      Offset(size.width * bend, topToBottom ? 0 : size.height);
  Offset get point2 => Offset(size.width, start.dy > end.dy ? rect.height : 0);
  Offset get anchor2 =>
      Offset(rect.width * (1 - bend), start.dy > end.dy ? rect.height : 0);
}
