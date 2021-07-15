import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'NumCard.dart';
import 'Calc_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: mainScreen(),
    );
  }
}
