import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //CREATE AIRCLE AVATAR FOR PROFILE IMAGE
          CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage('images/starwolf.png'),
            backgroundColor: Colors.white,
          ),
          // USERNAME
          Text(
            'Star Wolf',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Pacifico',
              fontWeight: FontWeight.bold,
              fontSize: 40.0,
            ),
          ),
          //USER JOB TITLE
          Text(
            'SOFTWARE DEVELOPER',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Source Sans Pro',
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
          //SOCIAL LINKS
          Card(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListTile(
              leading: Icon(
                Icons.facebook,
                color: Colors.black87,
              ),
              title: Text(
                'facebook',
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListTile(
              leading: Icon(
                Icons.discord,
                color: Colors.black87,
              ),
              title: Text(
                'discord',
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListTile(
              leading: Icon(
                Icons.phone,
                color: Colors.black87,
              ),
              title: Text(
                'contact',
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      )),
    ));
  }
}
