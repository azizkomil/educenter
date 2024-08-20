import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final VoidCallback onFilterPressed;

  const MySearchBar({
    required this.controller,
    required this.onChanged,
    required this.onFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          style: TextStyle(
            color: Colors.black,
            height: 1.5,
          ),
          cursorColor: Color(0xFF112299), // Change the cursor color to #112299
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 10.0),
              child: Icon(Icons.search, color: Color(0xFF112299)), // Change the search icon color to #112299
            ),
            prefixIconConstraints: BoxConstraints(
              minHeight: 32,
              minWidth: 32,
            ),
            hintText: 'Qidirish...',
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 12.0), // Center the text vertically
          ),
        ),
      ),
    );
  }
}
