import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Function(String) onSelected;

  const CategoryChip({
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(
        onTap: () => onSelected(label),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: isSelected ? Color(0xFF112299) : const Color.fromARGB(31, 0, 195, 255), // Blue when selected, grey when not
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Color(0xFF112299), // White text when selected, blue when not
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
