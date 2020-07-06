import 'package:flutter/material.dart';
import 'package:flutterLearning/Modals/appRouter.dart';

typedef void ToggleTheme();
typedef void ToggleView();

class DrawerMenu extends StatelessWidget {
  final ToggleTheme toggleTheme;
  final ToggleView toggleView;
  final bool isDark;
  final bool isGridView;
  DrawerMenu({this.toggleTheme, this.isDark, this.isGridView, this.toggleView});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text(
              "Praveen Software Private Limited",
              style: TextStyle(
                fontSize: 25,
                color: Theme.of(context).textSelectionColor
              ),
            ),
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
          ListTile(
            onTap: toggleTheme,
            title: Text(isDark ? 'Light Theme' : 'Dark Theme'),
            leading: Icon(
              Icons.brightness_medium,
            ),
          ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            onTap: toggleView,
            title: Text(isGridView ? 'Switch to list view' : 'Switch to grid view'),
            leading: Icon(
              isGridView ? Icons.list : Icons.grid_on,
            ),
          ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            onTap: () => Navigator.pushNamed(context, AppRouter.movieListRoute),
            leading: Icon(Icons.movie),
            title: Text('Anokhi Movies'),
          ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            onTap: () => Navigator.pushNamed(context, AppRouter.aboutUsRoute),
            leading: Icon(Icons.people),
            title: Text('About Us'),
          ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            onTap: () => Navigator.pushNamed(context, AppRouter.contactUsRoute),
            title: Text(
              'Contect Us',
            ),
            leading: Icon(
              Icons.contact_mail,
            ),
          )
        ],
      ),
    );
  }
}
