// main.dart
import 'package:flutter/material.dart';
import 'pages/profile_screen.dart';
import 'pages/clubprofilepage.dart';
// import 'pages/profile_extended_screen.dart';
// import 'pages/enhanced_profile_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Roboto',
      ),
      home: const ClubProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() {
  runApp(const MyApp());
}