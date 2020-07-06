import 'package:flutter/material.dart';
import 'package:flutterLearning/Modals/appRouter.dart';
import 'package:flutterLearning/Modals/post.dart';

class PostListItem extends StatelessWidget {
  final Post post;
  PostListItem({this.post});

  onPostTap(BuildContext context, Post _post) {
    Navigator.pushNamed(context, AppRouter.postDetailsRoute, arguments: _post);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              width: 0.1, style: BorderStyle.solid, color: Colors.grey),
        ),
      ),
      child: ListTile(
        title: Text(
          post.title,
          style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
        ),
        trailing:
            Icon(Icons.arrow_right, color: Theme.of(context).primaryColor),
        leading: Image.network(
          'https://www.dollargeneral.com/media/catalog/product/cache/0729a8e318a86bbdd225c6c8aa5967a3/0/0/00012000030284_a1a3_900_900.jpg',
          fit: BoxFit.cover,
          repeat: ImageRepeat.noRepeat,
          errorBuilder:
              (BuildContext context, Object exception, StackTrace stackTrace) {
            return Icon(
              Icons.not_interested,
              color: Colors.red,
            );
          },
        ),
        onTap: () => onPostTap(context, post),
      ),
    );
  }
}
