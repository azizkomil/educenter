import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  MainButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9, // 90% of screen width
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF112299), // Background color (purple similar to the image)
          padding: EdgeInsets.symmetric(vertical: 15), // Adjust padding to center text
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Rounded corners
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16, // Font size
            fontWeight: FontWeight.bold, // Bold font weight
            color: Colors.white, // Text color
          ),
        ),
      ),
    );
  }
}
