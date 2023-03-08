import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black87,
        body: Profile(),
      ),
    ),
  );
}

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('images/starwolf.png'),
            ),
            Text(
              'Star Wolf',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 40.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'FLUTTER DEVELOPER',
              style: TextStyle(
                fontFamily: 'Source Sans Pro',
                color: Colors.white,
                fontSize: 20.0,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Colors.white70,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.facebook),
                  label: Text('facebook'),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.instagram),
                  label: Text('Instagram'),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    (FontAwesomeIcons.twitter),
                  ),
                  label: Text('Twitter'),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    (FontAwesomeIcons.linkedin),
                  ),
                  label: Text('Linkedin'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}