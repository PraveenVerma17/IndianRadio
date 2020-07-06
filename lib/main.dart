import 'package:flutter/material.dart';
import 'package:flutterLearning/Modals/appRouter.dart';
import 'package:flutterLearning/Widgets/DrawerMenu/drawerMenu.dart';
import 'package:flutterLearning/Widgets/Stations/stationList.dart';
import './Widgets/AppBar/appheader.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  bool _isDarkTheme = true;
  bool _isGridView = true;

  void toggleTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
  }

  void toggleView(){
    setState(() {
      _isGridView = !_isGridView;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 60),
          child: AppHeader(
            title: 'Indian Radio',
          ),
        ),
        body: StationList(isGridView: _isGridView,),
        drawer: DrawerMenu(
          toggleTheme: toggleTheme,
          isDark: _isDarkTheme,
          isGridView: _isGridView,
          toggleView: toggleView,
        ),
      ),
      //routes: _routes,
      onGenerateRoute: AppRouter.generateRoutes,
    );
  }
}
