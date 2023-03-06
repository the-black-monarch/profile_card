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
          child: Center(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
