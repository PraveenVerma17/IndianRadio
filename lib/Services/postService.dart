import 'dart:convert';
import 'package:flutterLearning/Modals/post.dart';
import 'package:http/http.dart' as http;

class PostService {
  Future<List<Post>> fetchPosts() async {
    List<Post> _posts;
    String url = 'https://jsonplaceholder.typicode.com/posts';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      //Converting to List<Post>
      var postsJson = jsonDecode(response.body) as List;
      _posts = postsJson.map((post) => Post.fromJson(post)).toList();
    } else {
      throw new Exception('Post Fetch Service Failed');
    }

    return _posts;
  }
}
