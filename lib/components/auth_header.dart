import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  final VoidCallback? onLeftButtonPressed;
  final VoidCallback? onRightButtonPressed;
  final Color? leftButtonColor;  // Optional parameter for left button text color
  final Color? rightButtonColor; // Optional parameter for right button text color

  AuthHeader({
    this.onLeftButtonPressed,
    this.onRightButtonPressed,
    this.leftButtonColor,  // Initialize it
    this.rightButtonColor, // Initialize it
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        Row(
          children: [
            Image.asset(
              'lib/images/logo.png',
              height: 100,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '''Kiberxavfsizlik
Markzai''',
                  style: TextStyle(
                    fontSize: 30, 
                    color: Color(0xFF112299),
                  ),
                ),
                Text(
                  'O‘quv platformasiga hush kelibsiz!',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF112299),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20), 
        Container(
          height: 60,
          color: Color(0xFF3B2F88),
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: onLeftButtonPressed,
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: Text(
                    'Tizimga kirish',
                    style: TextStyle(
                      fontSize: 16,
                      color: leftButtonColor ?? Colors.white, // Use passed color or default to white
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: onRightButtonPressed,
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: Text(
                    'Ro\'yxatdan o\'tish',
                    style: TextStyle(
                      fontSize: 16,
                      color: rightButtonColor ?? Colors.white, // Use passed color or default to white
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
