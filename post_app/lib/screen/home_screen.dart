import 'package:flutter/material.dart';
import 'package:post_app/model/post_model.dart'; // Assuming this file contains the Post model.
import 'package:post_app/screen/comment_screen.dart';
import 'package:post_app/service/api_service.dart';

class MyHomepage extends StatefulWidget {
  final String title;

  const MyHomepage({super.key, required this.title});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  List<Post>? posts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                posts = await ApiService().getPost();
                setState(() {});
              },
              child: const Text("Fetch"),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: posts == null ? 0 : posts!.length,
                itemBuilder: (context, index) {
                  var post = posts![index];

                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CommentScreen(id: post.id.toString())));
                      },
                      child: Card(
                          child: Column(
                        children: [
                          Text(
                            post.title,
                            style: const TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            post.body,
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            post.body,
                            style: const TextStyle(fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                          const Divider(),
                        ],
                      )));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
