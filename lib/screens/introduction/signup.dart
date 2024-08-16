import 'package:educenter/components/auth_header.dart';
import 'package:educenter/components/main_button.dart';
import 'package:educenter/screens/introduction/OTP_Register.dart';
import 'package:educenter/screens/introduction/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final String _countryCode = '+998 ';
  String? _passwordError;
  String? _nameError;
  String? _confirmPasswordError;

  // FocusNodes for real-time validation when focused
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _passwordVisible = false; // Initially, password is obscure
    _confirmPasswordVisible = false; // Initially, confirm password is obscure
    _phoneController.text = ''; // Start with an empty controller

    // Add listeners to the controllers to validate in real-time
    _passwordController.addListener(_validatePasswordRealtime);
    _confirmPasswordController.addListener(_validateConfirmPasswordRealtime);
    _nameController.addListener(_validateNameRealtime);

    // Add focus listeners
    _nameFocusNode.addListener(_onFocusChange);
    _passwordFocusNode.addListener(_onFocusChange);
    _confirmPasswordFocusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    // Dispose the controllers and focus nodes when the widget is disposed
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
    _nameFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      // Validate only when the respective field is focused
      if (_nameFocusNode.hasFocus) {
        _nameError = _validateName(_nameController.text);
      } else {
        _nameError = null;
      }

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

  void _validateNameRealtime() {
    if (_nameFocusNode.hasFocus) {
      setState(() {
        _nameError = _validateName(_nameController.text);
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

  String? _validateName(String name) {
    // Ensure the name contains at least two words and at most four words
    final parts = name.trim().split(RegExp(r'\s+'));

    if (parts.length < 2 || parts.length > 4) {
      return 'Iltimos, to\'liq ismingizni to\'g\'ri kiriting';
    }

    for (String part in parts) {
      if (part.length < 3 || part.length > 20) {
        return 'Iltimos, to\'liq ismingizni to\'g\'ri kiriting';
      }
      if (RegExp(r'[0-9]').hasMatch(part)) {
        return 'Iltimos, to\'liq ismingizni to\'g\'ri kiriting';
      }
      if (RegExp(r'[!@#$%^&*()_+=\[\]{}:;"<>,.?\\|/]').hasMatch(part)) {
        return 'Iltimos, to\'liq ismingizni to\'g\'ri kiriting';
      }
    }

    return null; // Return null if the name is valid
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
                AuthHeader(
                  onLeftButtonPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  onRightButtonPressed: () {
                    // Handle "Ro'yxatdan o'tish" action
                    print("Ro'yxatdan o'tish pressed");
                  },
                  leftButtonColor: Colors.white.withOpacity(0.5),
                  
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _nameController,
                  focusNode: _nameFocusNode,
                  decoration: InputDecoration(
                    labelText: 'To\'liq ismingizni kiriting',
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
                    errorText: _nameError, // Display name validation error
                  ),
                  cursorColor: Color(0xFF112299), // Blue cursor color
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(9), // Limit input to 9 digits excluding the country code
                  ],
                  decoration: InputDecoration(
                    labelText: 'Telefon raqamingizni kiriting',
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
                    labelText: 'Parol kiriting',
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
                        color: Color(0xFF112299), // Blue eye icon
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible; // Toggle visibility
                        });
                      },
                    ),
                    errorText: _passwordError, // Display password validation error
                  ),
                  cursorColor: Color(0xFF112299), // Blue cursor color
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _confirmPasswordController,
                  focusNode: _confirmPasswordFocusNode,
                  obscureText: !_confirmPasswordVisible, // Toggle confirm password visibility
                  decoration: InputDecoration(
                    labelText: 'Parolni tasdiqlang',
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
                        _confirmPasswordVisible ? Icons.visibility_off : Icons.visibility,
                        color: Color(0xFF112299), // Blue eye icon
                      ),
                      onPressed: () {
                        setState(() {
                          _confirmPasswordVisible = !_confirmPasswordVisible; // Toggle visibility
                        });
                      },
                    ),
                    errorText: _confirmPasswordError, // Display confirm password validation error
                  ),
                  cursorColor: Color(0xFF112299), // Blue cursor color
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: MainButton(
          text: 'Davom etish',
          onPressed: () {
            setState(() {
              // Final validation when the button is pressed
              _passwordError = _validatePassword(_passwordController.text);
              _nameError = _validateName(_nameController.text);
              _confirmPasswordError = _validateConfirmPassword(
                  _passwordController.text, _confirmPasswordController.text);
              if (_passwordError == null && _nameError == null && _confirmPasswordError == null) {
                // Handle signup action
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConfirmOTPScreenRegister()),
                  );
              }
            });
          },
        ),
      ),
    );
  }
}
