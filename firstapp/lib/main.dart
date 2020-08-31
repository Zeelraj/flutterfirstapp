import 'package:firstapp/homePage.dart';
import 'package:flutter/material.dart';
import 'myHomePage.dart';

void main() {
  runApp(CRUD());
}

class CRUD extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD Operations',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}
