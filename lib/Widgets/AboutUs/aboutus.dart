import 'package:flutter/material.dart';
import 'package:flutterLearning/Widgets/AppBar/appheader.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {

  void _launchLinkedIn() async {
  const url = 'https://www.linkedin.com/in/praveen-verma-a7911015/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: AppHeader(
          title: 'About Us',
        ),
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                'I am Praveen Kumar Verma and i have built this application to learn google flutter to buiild ios and android application.',
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                '',
              ),
              Text(
                'I am a software developer in TATA CONSULTANCY SERVICES from last 10 years.',
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                'Working as technical architect in microsoft technologies.',
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                '',
              ),
              SizedBox(height: 30),
              RaisedButton(
                onPressed: _launchLinkedIn,
                child: const Text('My LinkedIn',
                    style: TextStyle(fontSize: 20)),
              ),
            ],
          )),
    );
  }
}
