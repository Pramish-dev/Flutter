import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  Color? backgroundColor;

  @override
  void initState() {
    super.initState();
    _loadPalette();
  }

  Future<void> _loadPalette() async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      AssetImage(
          'images/diamond.png'), // Replace with the actual path to your image asset
    );

    setState(() {
      backgroundColor = paletteGenerator.dominantColor?.color ?? Colors.white12;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _buildBody(),
        appBar: _buildAppBar(),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      color: backgroundColor ?? Colors.blueGrey,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                'images/diamond.png',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Center(child: Text('I am Rich')),
      backgroundColor: Colors.deepPurple,
    );
  }
}
