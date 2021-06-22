import 'dart:convert';
import 'package:http/http.dart' as http;

class Post {
  String id;
  String content;
  String created;
  String name;

  Post({this.id, this.content, this.created, this.name});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        id: json['_id'],
        content: json['content'],
        created: json['date'],
        name: json['name']);
  }
}

Future fetchPost() async {
  var response =
      await http.get(Uri.parse('https://secretclone.herokuapp.com/posts'));
  var jsonData = jsonDecode(response.body);

  if (response.statusCode == 200) {
    List<Post> postList = [];

    for (var p in jsonData) {
      Post post = Post.fromJson(p);
      postList.add(post);
    }
    return postList;
  } else {
    throw Exception('Failed to load posts');
  }
}
