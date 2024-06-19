import 'dart:convert';
import 'dart:developer';

import 'package:comment_app_api/model/comment_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  var baseUrl = "https://jsonplaceholder.typicode.com/";
  var comment = "comments";

  getComment() async {
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
  }
}
