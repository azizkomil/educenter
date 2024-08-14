import 'package:flutter/material.dart';
import 'package:educenter/screens/introduction/intro.dart'; // Import the IntroPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove the debug banner
      title: 'Edu App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IntroPage(), // Set IntroPage as the home screen
    );
  }
}
