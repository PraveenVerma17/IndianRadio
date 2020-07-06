import 'package:flutter/material.dart';
import 'package:flutterLearning/Modals/appRouter.dart';
import 'package:flutterLearning/Widgets/Movies/movies.dart';


class MoviesListItem extends StatelessWidget {

  final Movie movie;
  MoviesListItem({this.movie});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              width: 0.3, style: BorderStyle.solid, color: Colors.grey),
        ),
      ),
      padding: EdgeInsets.all(10),
      child: ListTile(
        title: Text(
          movie.name,
          style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
        ),
        leading: Image.network(
          movie.imgUrl,
          width: 40,
          height: double.maxFinite,
        ),
        trailing: Icon(
          Icons.arrow_right,
          color: Theme.of(context).textSelectionColor,
        ),
        onTap: () => Navigator.pushNamed(context, AppRouter.moviePlayerRoute, arguments: movie),
      ),
    );
  }
}