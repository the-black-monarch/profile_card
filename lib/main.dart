import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:profile_card/edit_profile_sheet.dart';
import 'package:profile_card/profile_card.dart';

// ThemeData for the app
final ThemeData darkTheme = ThemeData(
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.dark(
    primary: Colors.white,
    secondary: Colors.white70,
    surface: Colors.grey[850]!,
    onPrimary: Colors.black,
    onSecondary: Colors.white,
    onBackground: Colors.white,
    onSurface: Colors.white,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white70),
    headlineSmall: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  ),
  iconTheme: IconThemeData(color: Colors.white),
);

final ThemeData lightTheme = ThemeData(
  primaryColor: Colors.white,
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.light(
    primary: Colors.black,
    secondary: Colors.black87,
    surface: Colors.grey[200]!,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onBackground: Colors.black,
    onSurface: Colors.black,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(color: Colors.black87),
    headlineSmall: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
  ),
  iconTheme: IconThemeData(color: Colors.black),
);

// Profile data model
class Profile {
  String name;
  String jobTitle;
  String githubUrl;
  String facebookUrl;
  String twitterUrl;
  String email;

  Profile({
    required this.name,
    required this.jobTitle,
    required this.githubUrl,
    required this.facebookUrl,
    required this.twitterUrl,
    required this.email,
  });
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = true;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: ProfileScreen(toggleTheme: _toggleTheme),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  final VoidCallback toggleTheme;

  ProfileScreen({required this.toggleTheme});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Profile _profile = Profile(
    name: 'Star Wolf',
    jobTitle: 'FLUTTER DEVELOPER',
    githubUrl: 'https://github.com/StarWOlfEmperor',
    facebookUrl: 'https://facebook.com',
    twitterUrl: 'https://twitter.com',
    email: 'mailto:test@example.com',
  );

  void _updateProfile(Profile newProfile) {
    setState(() {
      _profile = newProfile;
    });
  }

  void _showEditSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return EditProfileSheet(
          profile: _profile,
          onSave: _updateProfile,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: _showEditSheet,
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: ProfileCard(profile: _profile),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: widget.toggleTheme,
        child: Icon(Icons.brightness_6),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
