import 'package:flutter/material.dart';
import 'package:horizontal_arrow/horizontal_arrow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Column(
          children: [
            Container(
              width: 200,
              height: 100,
              color: Colors.grey,
              child: CustomPaint(
                  painter: ConnectionsPainter(connections: [
                Connection(start: Offset(0, 0), end: Offset(200, 100)),
                Connection(start: Offset(0, 50), end: Offset(200, 50)),
                Connection(start: Offset(0, 100), end: Offset(200, 0)),
              ])),
            ),
            Row(children: [
              make(0.1),
              make(0.3),
              make(0.5),
              make(0.7),
              make(0.9),
              make(1),
              make(1.2),
            ]),
          ],
        ),
      ),
    );
  }
}

Widget make(double bend) {
  return Container(
    width: 200,
    height: 400,
    color: Colors.black12,
    child: CustomPaint(
      painter: ConnectionsPainter(
        connections: [
          Connection(start: Offset(0, 200), end: Offset(200, 0), bend: bend),
          Connection(start: Offset(0, 200), end: Offset(200, 100), bend: bend),
          Connection(start: Offset(0, 200), end: Offset(200, 200), bend: bend),
          Connection(start: Offset(0, 200), end: Offset(200, 300), bend: bend),
          Connection(start: Offset(0, 200), end: Offset(200, 400), bend: bend),
        ],
      ),
    ),
  );
}
