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
    const bend1 = 0.3;
    const bend2 = 0.7;
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
              Container(
                width: 200,
                height: 400,
                color: Colors.black12,
                child: CustomPaint(
                    painter: ConnectionsPainter(connections: [
                  Connection(
                      start: Offset(0, 200), end: Offset(200, 0)),
                  Connection(
                      start: Offset(0, 200), end: Offset(200, 100)),
                  Connection(
                      start: Offset(0, 200), end: Offset(200, 200)),
                  Connection(
                      start: Offset(0, 200), end: Offset(200, 300)),
                  Connection(
                      start: Offset(0, 200), end: Offset(200, 400)),
                ])),
              ),
              Container(
                width: 200,
                height: 400,
                color: Colors.black12,
                child: CustomPaint(
                    painter: ConnectionsPainter(connections: [
                      Connection(
                          start: Offset(0, 200), end: Offset(200, 0), bend: bend1),
                      Connection(
                          start: Offset(0, 200), end: Offset(200, 100), bend: bend1),
                      Connection(
                          start: Offset(0, 200), end: Offset(200, 200), bend: bend1),
                      Connection(
                          start: Offset(0, 200), end: Offset(200, 300), bend: bend1),
                      Connection(
                          start: Offset(0, 200), end: Offset(200, 400), bend: bend1),
                    ])),
              ),
              Container(
                width: 200,
                height: 400,
                color: Colors.black12,
                child: CustomPaint(
                    painter: ConnectionsPainter(connections: [
                      Connection(
                          start: Offset(0, 200), end: Offset(200, 0), bend: bend2),
                      Connection(
                          start: Offset(0, 200), end: Offset(200, 100), bend: bend2),
                      Connection(
                          start: Offset(0, 200), end: Offset(200, 200), bend: bend2),
                      Connection(
                          start: Offset(0, 200), end: Offset(200, 300), bend: bend2),
                      Connection(
                          start: Offset(0, 200), end: Offset(200, 400), bend: bend2),
                    ])),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
