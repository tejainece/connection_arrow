import 'dart:math';

import 'package:flutter/material.dart';

class Connection {
  final Offset start;
  final Offset end;
  final double bend;
  final Paint? stroke;
  final TipMaker? tip;

  const Connection(
      {required this.start,
      required this.end,
      this.bend = 0.5,
      this.stroke,
      this.tip});

  Path path() {
    final width = (end.dx - start.dx).abs();
    double endAnchorX = width * (1 - bend);
    if (width - endAnchorX < 75) {
      endAnchorX = 75;
    }
    return Path()
      ..moveTo(start.dx, start.dy)
      ..cubicTo(
        width * bend,
        start.dy,
        endAnchorX,
        end.dy,
        end.dx,
        end.dy,
      );
  }
}

class ConnectionsPainter extends CustomPainter {
  final List<Connection> connections;

  const ConnectionsPainter({this.connections = const []});

  @override
  void paint(Canvas canvas, Size size) {
    for (final connection in connections) {
      final paint = connection.stroke ?? defaultPaint;
      final path = connection.path();
      canvas.drawPath(path, paint);
    }

    for (final connection in connections) {
      connection.tip?.paint(canvas, connection.end);
    }
  }

  static final defaultPaint = Paint()
    ..color = Colors.black
    ..strokeWidth = 2
    ..style = PaintingStyle.stroke
    ..strokeJoin = StrokeJoin.round;

  @override
  bool shouldRepaint(ConnectionsPainter oldDelegate) => true;
}

abstract class TipMaker {
  Paint? get stroke;
  Paint? get fill;

  void paint(Canvas canvas, Offset point);
}

class ArrowTip implements TipMaker {
  final double angle;
  final double length;
  @override
  late final Paint? stroke;
  @override
  late final Paint? fill;

  ArrowTip({this.angle = 30, this.length = 15, Paint? stroke, Paint? fill}) {
    if (stroke == null && fill == null) {
      this.stroke = Paint()
        ..color = Colors.black
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke
        ..strokeJoin = StrokeJoin.round;
      this.fill = null;
    } else {
      this.stroke = stroke;
      this.fill = fill;
    }
  }

  Path _path(Offset point) {
    double angle = _toRadian(180 - this.angle);
    final start = Offset(length * cos(angle), length * sin(angle));
    final end = Offset(length * cos(-angle), length * sin(-angle));
    return Path()
      ..moveTo(point.dx, point.dy)
      ..relativeLineTo(start.dx, start.dy)
      ..moveTo(point.dx, point.dy)
      ..relativeLineTo(end.dx, end.dy);
  }

  @override
  void paint(Canvas canvas, Offset point) {
    if (stroke != null) canvas.drawPath(_path(point), stroke!);
    if (fill != null) canvas.drawPath(_path(point), fill!);
  }
}

class CircleTip implements TipMaker {
  final double radius;
  @override
  late final Paint? stroke;
  @override
  late final Paint? fill;

  CircleTip({this.radius = 5, Paint? stroke, Paint? fill}) {
    if (stroke == null && fill == null) {
      this.stroke = Paint()
        ..color = Colors.black
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke
        ..strokeJoin = StrokeJoin.round;
      this.fill = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.fill;
    } else {
      this.stroke = stroke;
      this.fill = fill;
    }
  }

  @override
  void paint(Canvas canvas, Offset point) {
    if (stroke != null) canvas.drawCircle(point, radius, stroke!);
    if (fill != null) canvas.drawCircle(point, radius, fill!);
  }
}

double _toRadian(double degree) => degree * pi / 180;
