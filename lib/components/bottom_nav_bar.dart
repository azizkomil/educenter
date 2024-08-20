import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90, // Increase the height of the blue bar
      decoration: BoxDecoration(
        color: Color(0xFF112299), // Set the background color to #112299
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            icon: Icons.home,
            label: 'ASOSIY',
            index: 0,
            activeColor: Color(0xFF00D9FF),
            inactiveColor: Colors.white,
          ),
          _buildNavItem(
            icon: Icons.book,
            label: 'KURSLARIM',
            index: 1,
            activeColor: Color(0xFF00D9FF),
            inactiveColor: Colors.white,
          ),
          _buildNavItem(
            icon: Icons.chat_bubble_outline,
            label: 'YANGILIKLAR',
            index: 2,
            activeColor: Color(0xFF00D9FF),
            inactiveColor: Colors.white,
          ),
          _buildNavItem(
            icon: Icons.favorite_border,
            label: 'SEVIMLILAR',
            index: 3,
            activeColor: Color(0xFF00D9FF),
            inactiveColor: Colors.white,
          ),
          _buildNavItem(
            icon: Icons.person_outline,
            label: 'PROFIL',
            index: 4,
            activeColor: Color(0xFF00D9FF),
            inactiveColor: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    required Color activeColor,
    required Color inactiveColor,
  }) {
    final bool isActive = index == currentIndex;
    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isActive ? activeColor : inactiveColor,
            size: 24,
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isActive ? activeColor : inactiveColor,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
