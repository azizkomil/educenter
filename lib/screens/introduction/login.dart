import 'package:educenter/components/auth_header.dart';
import 'package:educenter/components/main_button.dart';
import 'package:educenter/screens/home.dart';
import 'package:educenter/screens/introduction/ForgotPassword.dart';
import 'package:educenter/screens/introduction/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  final String? successMessage; // Optional success message

  LoginScreen({this.successMessage});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible = false;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final String _countryCode = '+998 ';
  String? _phoneError;
  String? _passwordError;

  // FocusNodes for real-time validation when focused
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _passwordVisible = false; // Initially, password is obscure
    _phoneController.text = ''; // Start with an empty controller

    // Add listeners to the controllers to validate in real-time
    _passwordController.addListener(_validatePasswordRealtime);

    // Add focus listeners
    _passwordFocusNode.addListener(_onFocusChange);

    // Show success message if it's passed
    if (widget.successMessage != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(widget.successMessage!),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
          ),
        );
      });
    }
  }

  @override
  void dispose() {
    // Dispose the controllers and focus nodes when the widget is disposed
    _phoneController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
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
    });
  }

  void _validatePasswordRealtime() {
    if (_passwordFocusNode.hasFocus) {
      setState(() {
        _passwordError = _validatePassword(_passwordController.text);
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

  void _validateFields() {
    setState(() {
      // Validate phone number
      if (_phoneController.text.length != 9) {
        _phoneError = 'Telefon raqamini to\'liq kiriting';
      } else {
        _phoneError = null;
      }

      // Validate password
      _passwordError = _validatePassword(_passwordController.text);

      // If both fields are valid, navigate to HomeScreen
      if (_phoneError == null && _passwordError == null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    });
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
                // Using the AuthHeader component
                AuthHeader(
                  onLeftButtonPressed: () {
                    // Handle "Tizimga kirish" action
                    print("Tizimga kirish pressed");
                  },
                  onRightButtonPressed: () {
                    // Navigate to the SignupScreen when "Ro'yxatdan o'tish" is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                  rightButtonColor: Colors.white.withOpacity(0.5),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _phoneController,
                  focusNode: _phoneFocusNode,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(9), // Limit input to 9 digits excluding the country code
                  ],
                  decoration: InputDecoration(
                    labelText: 'Telefon raqam',
                    labelStyle: TextStyle(
                      color: Colors.grey, // Change label text color to grey
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
                    prefixText: _countryCode,
                    prefixStyle: TextStyle(
                      color: Colors.black, // Change prefix text color
                      fontSize: 15.5, // Match the font size of the entered numbers
                    ),
                    errorText: _phoneError,
                  ),
                  cursorColor: Color(0xFF112299), // Blue cursor color
                  style: TextStyle(
                    fontSize: 16.0, // Ensure the entered numbers have the same font size as the prefix
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  obscureText: !_passwordVisible, // Toggle password visibility
                  decoration: InputDecoration(
                    labelText: 'Parolingizni kiriting',
                    labelStyle: TextStyle(
                      color: Colors.grey, // Change label text color to grey
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
                Center(
                  child: TextButton(
                    onPressed: () {
                      // Navigate to Forgot Password Screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                      );
                    },
                    child: Text(
                      'Parolni unutdingizmi?',
                      style: TextStyle(color: Color(0xFF112299)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: MainButton(
          text: 'Kirish',
          onPressed: _validateFields, // Validate fields when button is pressed
        ),
      ),
    );
  }
}
