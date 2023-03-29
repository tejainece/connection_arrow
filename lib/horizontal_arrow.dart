import 'package:flutter/material.dart';

class HorizontalArrow extends CustomPainter {
  final ArrowConfig config;

  const HorizontalArrow({required this.config});

  @override
  void paint(Canvas canvas, Size size) {
    final startPoint = config.startPoint(size);
    final startAnchor = config.startAnchor(size);
    final endPoint = config.endPoint(size);
    final endAnchor = config.endAnchor(size);
    Path bezierPath = Path()
      ..moveTo(startPoint.dx, startPoint.dy)
      ..cubicTo(
        startAnchor.dx,
        startAnchor.dy,
        endAnchor.dx,
        endAnchor.dy,
        endPoint.dx,
        endPoint.dy,
      );

    final bezierPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(bezierPath, bezierPaint);
  }

  @override
  bool shouldRepaint(HorizontalArrow oldDelegate) =>
      oldDelegate.config.isEqual(config);
}

class ArrowConfig {
  final double bend;
  final bool topToBottom;

  ArrowConfig({this.bend = 0.5, this.topToBottom = false});

  Offset startPoint(Size size) => Offset(0, topToBottom ? 0 : size.height);
  Offset startAnchor(Size size) =>
      Offset(size.width * bend, topToBottom ? 0 : size.height);
  Offset endPoint(Size size) =>
      Offset(size.width, topToBottom ? size.height : 0);
  Offset endAnchor(Size size) =>
      Offset(size.width * (1 - bend), topToBottom ? size.height : 0);

  bool isEqual(ArrowConfig other) =>
      bend == other.bend && topToBottom == other.topToBottom;
}
