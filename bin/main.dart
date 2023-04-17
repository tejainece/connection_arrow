import 'package:flutter/material.dart';
import 'package:curvy_connection/curvy_connection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Curvy connection',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: InteractiveViewer(
          child: Column(
            children: [
              Container(
                width: 200,
                height: 100,
                color: Colors.grey,
                child: const CustomPaint(
                    painter: ConnectionsPainter(connections: [
                  Connection(start: Offset(0, 0), end: Offset(200, 100)),
                  Connection(start: Offset(0, 50), end: Offset(200, 50)),
                  Connection(start: Offset(0, 100), end: Offset(200, 0)),
                ])),
              ),
              Row(children: [
                make(0.1, tip: ArrowTip()),
                make(0.3, tip: ArrowTip()),
                make(0.5, tip: ArrowTip()),
                make(0.7, tip: ArrowTip()),
                make(0.9, tip: ArrowTip()),
                make(1, tip: ArrowTip()),
                make(1.2, tip: ArrowTip()),
              ]),
              Row(children: [
                make(0.1, tip: CircleTip()),
                make(0.3, tip: CircleTip()),
                make(0.5, tip: CircleTip()),
                make(0.7, tip: CircleTip()),
                make(0.9, tip: CircleTip()),
                make(1, tip: CircleTip()),
                make(1.2, tip: CircleTip()),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

Widget make(double bend, {TipMaker? tip}) {
  return Container(
    width: 200,
    height: 400,
    margin: EdgeInsets.only(right: 20),
    color: Colors.black12,
    child: CustomPaint(
      painter: ConnectionsPainter(
        connections: [
          Connection(
              start: Offset(0, 200), end: Offset(200, 0), bend: bend, tip: tip),
          Connection(
              start: Offset(0, 200),
              end: Offset(200, 100),
              bend: bend,
              tip: tip),
          Connection(
              start: Offset(0, 200),
              end: Offset(200, 200),
              bend: bend,
              tip: tip),
          Connection(
              start: Offset(0, 200),
              end: Offset(200, 300),
              bend: bend,
              tip: tip),
          Connection(
              start: Offset(0, 200),
              end: Offset(200, 400),
              bend: bend,
              tip: tip),
        ],
      ),
    ),
  );
}
