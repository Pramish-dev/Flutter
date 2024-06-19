import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Chessboard'),
        ),
        body: ChessBoard(),
      ),
    );
  }
}

class ChessBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 8, // 8 columns
      ),
      itemBuilder: (context, index) {
        // Determine the color of the square
        final int row = index ~/ 8;
        final int col = index % 8;
        final bool isWhite = (row + col) % 2 == 0;

        return Container(
          color: isWhite ? Colors.white : Colors.black,
        );
      },
      itemCount: 64, // 8x8 chessboard
    );
  }
}
