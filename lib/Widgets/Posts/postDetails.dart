import 'package:flutter/material.dart';
import 'package:flutterLearning/Modals/post.dart';
import 'package:flutterLearning/Widgets/AppBar/appheader.dart';

class PostDetails extends StatelessWidget {
  final Post post;
  PostDetails({this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: AppHeader(
          title: 'Post Detail',
        ),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          Text(
            post.body,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      )),
    );
  }
}
