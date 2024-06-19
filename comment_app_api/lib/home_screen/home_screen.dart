import 'package:comment_app_api/model/comment_model.dart';
import 'package:comment_app_api/service/api_service.dart';
import 'package:flutter/material.dart';

class MyHomepage extends StatefulWidget {
  final String title;

  const MyHomepage({super.key, required this.title});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  List<Comment>? comments = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(9),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                comments = await ApiService().getComment();
                setState(() {});
              },
              child: const Text("Comment"),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: comments == null ? 0 : comments!.length,
                itemBuilder: (context, index) {
                  var comment = comments![index];
                  return ListTile(
                    title: Text(comment.name),
                    subtitle: Text(comment.body),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
