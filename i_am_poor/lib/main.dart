import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('I am Poor'),
          ),
          backgroundColor: Colors.grey,
        ),
        body: FullScreenImage(),
      ),
    ),
  );
}

class FullScreenImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.asset(
            'images/poor.png',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
