import 'package:flutter/material.dart';
import 'package:flutterLearning/Widgets/AppBar/appheader.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: AppHeader(
          title: 'Contact Us',
        ),
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Email:',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                  Text('  '),
                  Text(
                    'Praveen.patel.17@gmail.com',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Phone:',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                  Text('  '),
                  Text(
                    '+1 551-404-0652',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
