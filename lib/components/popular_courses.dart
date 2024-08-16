import 'package:flutter/material.dart';
import 'category.dart'; // Reuse the CategorySection

class PopularCoursesSection extends StatelessWidget {
  final String title;
  final List<String> courses;
  final Color activeColor;
  final Color inactiveColor;
  final Color textColor;
  final Color activeTextColor;
  final bool showBorders;

  PopularCoursesSection({
    required this.title,
    required this.courses,
    required this.activeColor,
    required this.inactiveColor,
    required this.textColor,
    required this.activeTextColor,
    this.showBorders = true,
  });

  @override
  Widget build(BuildContext context) {
    return CategorySection(
      title: title,
      categories: courses,
      activeColor: activeColor,
      inactiveColor: inactiveColor,
      textColor: textColor,
      activeTextColor: activeTextColor,
      showBorders: showBorders,
    );
  }
}
