import 'package:flutter/material.dart';
import 'package:flutterLearning/Modals/post.dart';
import 'package:flutterLearning/Widgets/AboutUs/aboutus.dart';
import 'package:flutterLearning/Widgets/AppBar/appheader.dart';
import 'package:flutterLearning/Widgets/ContactUs/contact.dart';
import 'package:flutterLearning/Widgets/Movies/movies.dart';
import 'package:flutterLearning/Widgets/Movies/moviesList.dart';
import 'package:flutterLearning/Widgets/Player/moviePlayer.dart';
import 'package:flutterLearning/Widgets/Player/player.dart';
import 'package:flutterLearning/Widgets/Posts/postDetails.dart';
import 'package:flutterLearning/Widgets/Posts/postList.dart';
import 'package:flutterLearning/Widgets/Stations/station.dart';

class AppRouter {
  static const String postListRoute = '/';
  static const String postDetailsRoute = '/postdetails';
  static const String stationPlayerRoute = '/player';
  static const String movieListRoute = '/movies';
  static const String moviePlayerRoute = '/moviePlayer';
  static const String aboutUsRoute = '/aboutus';
  static const String contactUsRoute = '/contactus';

  static Route<dynamic> generateRoutes(RouteSettings setting) {
    switch (setting.name) {
      case postListRoute:
        {
          return MaterialPageRoute(builder: (context) => PostList());
        }
      case postDetailsRoute:
        {
          Post _post = setting.arguments as Post;
          return MaterialPageRoute(
            builder: (context) => PostDetails(
              post: _post,
            ),
          );
        }

      case stationPlayerRoute:
        {
          Station _station = setting.arguments as Station;
          return MaterialPageRoute(
              builder: (context) => Player(
                    station: _station,
                  ));
        }

      case movieListRoute: {
        return MaterialPageRoute(
          builder: (context) => MoviesList(),
        );
      }  

      case moviePlayerRoute:
      {
        Movie _movie = setting.arguments as Movie;
        return MaterialPageRoute(
              builder: (context) => MoviePlayer(
                    movie: _movie,
                  ));
      }

      case aboutUsRoute: {
        return MaterialPageRoute(
          builder: (context) => AboutUs(),
        );
      }  

      case contactUsRoute: {
        return MaterialPageRoute(
          builder: (context) => ContactUs(),
        );
      } 

      default:
        {
          return MaterialPageRoute(builder: (context) {
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size(double.infinity, 60),
                child: AppHeader(title: 'Garima'),
              ),
              body: Text('No route found'),
            );
          });
        }
    }
  }
}
