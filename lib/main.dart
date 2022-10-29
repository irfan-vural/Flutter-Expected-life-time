import 'package:flutter/material.dart';
import 'input_page.dart';
import 'icon_cinsiyet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.lightBlue,
            primaryColor: Colors.lightBlue),
        home: InputPage());
  }
}
