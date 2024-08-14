import 'package:flutter/material.dart';

class LogoAndTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'lib/images/logo.png',
          height: 110,
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '''Kiberxavfsizlik 
Markazi''',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3B2F88),
              ),
            ),
            Text(
              'o\'quv platformasiga hush kelibsiz!',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF3B2F88),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
