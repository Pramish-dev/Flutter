import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:post_app/model/comment_model.dart';
import 'package:post_app/model/post_model.dart';

class ApiService {
  var baseUrl = "https://jsonplaceholder.typicode.com/";
  var post = "posts";
  var comment = "comments";
  getPost() async {
    try {
      var url = Uri.parse(baseUrl + post);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var decodeResponse = jsonDecode(response.body);
        List<Post> posts = postFromJson(jsonEncode(decodeResponse));
        return posts;
      }
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<List<Comment>?> getComment(String s) async {
    try {
      var url = Uri.parse(baseUrl + comment);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var decodeResponse = jsonDecode(response.body);
        List<Comment> comments = commentFromJson(jsonEncode(decodeResponse));
        return comments;
      }
    } catch (e) {
      log(e.toString());
      return [];
    }
    return null;
  }
}
