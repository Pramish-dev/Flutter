import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:post_app/model/post_model.dart';

class ApiService {
  var baseUrl = "https://jsonplaceholder.typicode.com/";
  var post = "posts";
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
}
