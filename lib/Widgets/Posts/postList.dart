import 'package:flutter/material.dart';
import 'package:flutterLearning/Modals/post.dart';
import 'package:flutterLearning/Services/postService.dart';
import 'package:flutterLearning/Widgets/Posts/postListItem.dart';

class PostList extends StatefulWidget {
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  Future<List<Post>> _posts;

  //Initial state call
  @override
  void initState() {
    super.initState();
    PostService _service = PostService();
    _posts = _service.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _posts,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          List<Post> posts = snapshot.data;
          return ListView(
            children: posts.map((post) {
              return PostListItem(post: post);
            }).toList(),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
