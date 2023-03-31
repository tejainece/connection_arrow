import 'dart:ui';

import 'package:arrow_path/arrow_path.dart';
import 'package:flutter/material.dart';

class Connection {
  final Offset start;
  final Offset end;
  final double bend;

  Connection({required this.start, required this.end, this.bend = 0.5});

  Path path() {
    final width = (end.dx - start.dx).abs();
    var path = Path();
    if (start.dy == end.dy) {
      path
        ..moveTo(start.dx, start.dy)
        ..lineTo(end.dx, end.dy);
    } else {
      path
        ..moveTo(start.dx, start.dy)
        ..cubicTo(
          width * bend,
          start.dy,
          width * bend,
          end.dy,
          end.dx,
          end.dy,
        );
    }
    return ArrowPath.make(path: path);
  }
}

class ConnectionsPainter extends CustomPainter {
  final List<Connection> connections;

  const ConnectionsPainter({this.connections = const []});

  @override
  void paint(Canvas canvas, Size size) {
    final bezierPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round;

    for(final connection in connections) {
      final path = connection.path();
      canvas.drawPath(path, bezierPaint);
    }
  }

  @override
  bool shouldRepaint(ConnectionsPainter oldDelegate) => true;
}