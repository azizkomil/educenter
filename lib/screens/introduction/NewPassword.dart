import 'package:educenter/components/auth_header.dart';
import 'package:educenter/components/main_button.dart';
import 'package:educenter/screens/introduction/login.dart';
import 'package:educenter/screens/introduction/signup.dart';
import 'package:flutter/material.dart';

class NewPasswordScreen extends StatefulWidget {
  @override
  _NewPasswordScreenState createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  String? _passwordError;
  String? _confirmPasswordError;

  // FocusNodes for real-time validation when focused
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _passwordVisible = false; // Initially, password is obscure
    _confirmPasswordVisible = false; // Initially, confirm password is obscure

    // Add listeners to the controllers to validate in real-time
    _passwordController.addListener(_validatePasswordRealtime);
    _confirmPasswordController.addListener(_validateConfirmPasswordRealtime);

    // Add focus listeners
    _passwordFocusNode.addListener(_onFocusChange);
    _confirmPasswordFocusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    // Dispose the controllers and focus nodes when the widget is disposed
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      // Validate only when the respective field is focused
      if (_passwordFocusNode.hasFocus) {
        _passwordError = _validatePassword(_passwordController.text);
      } else {
        _passwordError = null;
      }

      if (_confirmPasswordFocusNode.hasFocus) {
        _confirmPasswordError = _validateConfirmPassword(
            _passwordController.text, _confirmPasswordController.text);
      } else {
        _confirmPasswordError = null;
      }
    });
  }

  void _validatePasswordRealtime() {
    if (_passwordFocusNode.hasFocus) {
      setState(() {
        _passwordError = _validatePassword(_passwordController.text);
      });
    }
  }

  void _validateConfirmPasswordRealtime() {
    if (_confirmPasswordFocusNode.hasFocus) {
      setState(() {
        _confirmPasswordError = _validateConfirmPassword(
            _passwordController.text, _confirmPasswordController.text);
      });
    }
  }

  String? _validatePassword(String password) {
    if (password.length < 8) {
      return 'Parol kamida 8 ta belgidan iborat bo\'lishi kerak';
    }
    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return 'Parol kamida bitta katta harfni o\'z ichiga olishi kerak';
    }
    if (!RegExp(r'[0-9]').hasMatch(password)) {
      return 'Parol kamida bitta raqamni o\'z ichiga olishi kerak';
    }
    if (!RegExp(r'[!@#$%^&*]').hasMatch(password)) {
      return 'Parol kamida bitta maxsus belgi (!@#%^&*) ni o\'z ichiga olishi kerak';
    }
    return null; // Return null if the password is valid
  }

  String? _validateConfirmPassword(String password, String confirmPassword) {
    if (password != confirmPassword) {
      return 'Parollar mos emas';
    }
    return null; // Return null if the passwords match
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Auth Header with custom buttons
                AuthHeader(
                  onLeftButtonPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  onRightButtonPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                  leftButtonColor: Colors.white.withOpacity(0.5),
                  rightButtonColor: Colors.white.withOpacity(0.5),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'Parolni tiklash',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    'Yangi parolingizni kiriting va tasdiqlang.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  obscureText: !_passwordVisible, // Toggle password visibility
                  decoration: InputDecoration(
                    labelText: 'Yangi parolni kiriting',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: UnderlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF112299)),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF112299)),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible ? Icons.visibility_off : Icons.visibility,
                        color: Color(0xFF112299),
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    errorText: _passwordError,
                  ),
                  cursorColor: Color(0xFF112299),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _confirmPasswordController,
                  focusNode: _confirmPasswordFocusNode,
                  obscureText: !_confirmPasswordVisible, // Toggle confirm password visibility
                  decoration: InputDecoration(
                    labelText: 'Yangi parolni tasdiqlang',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: UnderlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF112299)),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF112299)),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _confirmPasswordVisible ? Icons.visibility_off : Icons.visibility,
                        color: Color(0xFF112299),
                      ),
                      onPressed: () {
                        setState(() {
                          _confirmPasswordVisible = !_confirmPasswordVisible;
                        });
                      },
                    ),
                    errorText: _confirmPasswordError,
                  ),
                  cursorColor: Color(0xFF112299),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: MainButton(
          text: 'Saqlash',
          onPressed: () {
            setState(() {
              // Final validation when the button is pressed
              _passwordError = _validatePassword(_passwordController.text);
              _confirmPasswordError = _validateConfirmPassword(
                  _passwordController.text, _confirmPasswordController.text);
              if (_passwordError == null && _confirmPasswordError == null) {
                // Handle saving password action
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(
                      successMessage: 'Yangi parol muvoffaqqiyatli o\'rnatildi',
                    ),
                  ),
                  (route) => false,
                );
              }
            });
          },
        ),
      ),
    );
  }
}
