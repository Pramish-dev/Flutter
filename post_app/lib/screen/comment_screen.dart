import 'package:flutter/material.dart';
import 'package:post_app/model/comment_model.dart';
import 'package:post_app/service/api_service.dart';

class CommentScreen extends StatefulWidget {
  final String id;
  const CommentScreen({super.key, required this.id});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  List<Comment>? comments = [];

  @override
  void initState() {
    super.initState();
    getComment();
  }

  getComment() async {
    comments =
        (await ApiService().getComment(" post_app/${widget.id}/comments"))!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: comments == null ? 0 : comments!.length,
          itemBuilder: (context, index) {
            var comment = comments![index];
            return GestureDetector(
              child: Card(
                color: Colors.black12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email : ${comment.email}",
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      comment.body,
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
