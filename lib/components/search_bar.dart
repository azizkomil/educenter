import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Background color of the search bar
        borderRadius: BorderRadius.circular(25.0), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Your shadow color
            offset: Offset(3, 3), // Position of the shadow
            blurRadius: 5.0, // Blur radius for the shadow
          ),
          BoxShadow(
            color: Colors.white, // Your background color
            spreadRadius: -12.0, // Negative spread to create inset effect
            blurRadius: 12.0, // Blur radius for the shadow
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Color(0xFF112299)),
          hintText: "Qidirish...",
          filled: true,
          fillColor: Colors.white, // Fill color of the text field
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide.none, // No border
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        ),
      ),
    );
  }
}
