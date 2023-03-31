import 'dart:math';
import 'dart:ui';

import 'package:arrow_path/arrow_path.dart';
import 'package:flutter/material.dart';

class Connection {
  final Offset start;
  final Offset end;
  final double bend;
  final double tipAngle;
  final double tipLength;

  Connection(
      {required this.start,
      required this.end,
      this.bend = 0.5,
      this.tipAngle,
      this.tipLength});

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
          width * (1 - bend),
          end.dy,
          end.dx,
          end.dy,
        );
    }
    return path;
    return ArrowPath.make(path: path, isAdjusted: true);
  }
}

class ConnectionsPainter extends CustomPainter {
  final List<Connection> connections;

  const ConnectionsPainter({this.connections = const []});

  @override
  void paint(Canvas canvas, Size size) {
    final connectionPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round;

    for (final connection in connections) {
      final path = connection.path();
      canvas.drawPath(path, connectionPaint);
    }

    final tipPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round;

    for (final connection in connections) {
      final path =
          arrowTip(connection.end, connection.tipAngle, connection.tipLength);
      canvas.drawPath(path, tipPaint);
    }
  }

  @override
  bool shouldRepaint(ConnectionsPainter oldDelegate) => true;
}

Path arrowTip(Offset point, double angle, double length) {
  final start = Offset(length * cos(angle), length * sin(angle));
  final end = Offset(length * cos(-angle), length * sin(-angle));
  return Path()
    ..moveTo(point.dx, point.dy)
    ..relativeLineTo(start.dx, start.dy)
    ..moveTo(point.dx, point.dy)
    ..relativeLineTo(end.dx, end.dy);
}
