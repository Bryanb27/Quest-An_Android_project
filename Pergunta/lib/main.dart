import 'package:flutter/material.dart';
import 'package:untitled/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
    home: Home(),
    );
  }


}