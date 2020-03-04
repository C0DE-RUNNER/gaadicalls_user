import 'package:flutter/material.dart';
import './options.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  MyApp(){}

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "GoGetters App",
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new Options()
    );
  }
}

