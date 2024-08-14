import 'package:flutter/material.dart';
import '../introduction/onboarding.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // This part contains the centered logo and circle
          Expanded(
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color(0xFF112299), // Circle border color
                        width: 4.0,
                      ),
                    ),
                  ),
                  Image.asset(
                    'lib/images/logo.png', // Replace with your logo asset path
                    width: 200,
                    height: 200,
                  ),
                ],
              ),
            ),
          ),
          // This part contains the button at the bottom
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: MainButton(
              text: 'Boshlash', // Button text
              onPressed: () {
                // Navigate to the onboarding screen when pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OnboardingPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Button widget that will be used across multiple pages
class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  MainButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF3B2F88), // Button background color
        padding: EdgeInsets.symmetric(horizontal: 150, vertical: 15), // Button size
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Rounded corners
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16, // Font size
          fontWeight: FontWeight.bold, // Bold text
          color: Colors.white, // Text color
        ),
      ),
    );
  }
}
