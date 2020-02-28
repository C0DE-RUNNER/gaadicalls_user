import 'package:flutter/material.dart';
import 'package:flutterapp/Screen1.dart';
import 'settings.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "GoGetters App",
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new Screen1()
    );
  }
}

