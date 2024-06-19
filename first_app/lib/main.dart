import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Text(
        "Kushal is GAY",
        style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.w800,
            decoration: TextDecoration.combine(
                [TextDecoration.overline, TextDecoration.underline])),
      ),
    );
  }
}
