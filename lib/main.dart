import 'package:flutter/material.dart';
import 'list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ASG4",
      home: FirstPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
