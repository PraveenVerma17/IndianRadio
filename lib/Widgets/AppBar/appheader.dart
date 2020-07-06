import 'package:flutter/material.dart';



class AppHeader extends StatelessWidget {
  final String title;
  
  AppHeader({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        title: Text(title),
      ),
    );
  }
}
