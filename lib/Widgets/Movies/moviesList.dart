import 'package:flutter/material.dart';
import 'package:flutterLearning/Widgets/AppBar/appheader.dart';
import 'package:flutterLearning/Widgets/Movies/movies.dart';
import 'package:flutterLearning/Widgets/Movies/moviesListItem.dart';
import 'package:flutterLearning/common/moviesData.dart';

class MoviesList extends StatefulWidget {
  @override
  _MoviesListState createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  final List<Movie> movies = moviesList.map((movie) {
    return Movie(
        id: movie['id'],
        imgUrl: movie['imgUrl'],
        name: movie['name'],
        url: movie['url']);
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: AppHeader(
          title: 'Anokhi Movies',
        ),
      ),
      body: ListView(
        children: movies.map((movie) {
          return MoviesListItem(
            movie: movie,
          );
        }).toList(),
      ),
    );
  }
}
