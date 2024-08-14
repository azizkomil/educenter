import 'package:flutter/material.dart';

class ToggleButtonsWidget extends StatelessWidget {
  final bool isLogin;
  final VoidCallback onLoginPressed;
  final VoidCallback onSignupPressed;

  ToggleButtonsWidget({
    required this.isLogin,
    required this.onLoginPressed,
    required this.onSignupPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 25.0),
      height: 80,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Color(0xFF5039B3),
            ),
          ),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: onLoginPressed,
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.transparent,
                    ),
                    child: Center(
                      child: Text(
                        'Tizimga kirish',
                        style: TextStyle(
                          color: isLogin ? Colors.white.withOpacity(1.0) : Colors.white.withOpacity(0.5),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: onSignupPressed,
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.transparent,
                    ),
                    child: Center(
                      child: Text(
                        "Ro'yxatdan o'tish",
                        style: TextStyle(
                          color: !isLogin ? Colors.white.withOpacity(1.0) : Colors.white.withOpacity(0.5),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
