import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widgets',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pramish"),
        elevation: 2,
      ),
      body: Container(
        width: double.infinity,
        color: Colors.blueGrey,
        child: const Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Pramish',
                style: TextStyle(color: Colors.brown, fontSize: 50)),
            Row(
              children: [
                Icon(
                  Icons.home,
                  size: 50,
                  color: Colors.cyan,
                ),
                Icon(
                  Icons.star,
                  size: 50,
                  color: Colors.cyan,
                ),
              ],
            ),
            Image(
              height: 100,
              image: NetworkImage(
                  "https://images.pexels.com/photos/775201/pexels-photo-775201.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
            ),
            Image(
              image: AssetImage("img.jpeg"),
            ),
          ],
        ),
      ),
    );
  }
}
