import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'main.dart';

class ProfileCard extends StatelessWidget {
  final Profile profile;

  ProfileCard({required this.profile});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20.0),
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('images/wolf.png'),
            ),
            SizedBox(height: 20.0),
            Text(
              profile.name,
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Pacifico',
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              profile.jobTitle,
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: 'Source Sans Pro',
                letterSpacing: 2.5,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            SizedBox(height: 10.0),
            Wrap(
              spacing: 20.0,
              runSpacing: 10.0,
              alignment: WrapAlignment.center,
              children: <Widget>[
                _buildSocialIcon(FontAwesomeIcons.github, profile.githubUrl),
                _buildSocialIcon(FontAwesomeIcons.facebook, profile.facebookUrl),
                _buildSocialIcon(FontAwesomeIcons.twitter, profile.twitterUrl),
                _buildSocialIcon(FontAwesomeIcons.solidEnvelope, profile.email),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return InkWell(
      onTap: () => _launchURL(url),
      borderRadius: BorderRadius.circular(30.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FaIcon(
          icon,
          size: 30.0,
        ),
      ),
    );
  }
}
