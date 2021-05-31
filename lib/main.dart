import 'package:flutter/material.dart';
import 'package:loading_animation/home.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return HomePage();
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
