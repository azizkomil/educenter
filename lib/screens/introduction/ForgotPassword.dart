import 'package:educenter/components/auth_header.dart';
import 'package:educenter/components/main_button.dart';
import 'package:educenter/screens/introduction/OTP_Forgot.dart';
import 'package:educenter/screens/introduction/login.dart';
import 'package:educenter/screens/introduction/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final String _countryCode = '+998 ';
  String? _phoneError;

  void _validatePhoneNumber() {
    setState(() {
      if (_phoneController.text.length != 9) {
        _phoneError = 'Telefon raqamini to\'liq kiriting';
      } else {
        _phoneError = null;
        // Navigate to the OTP confirmation screen if phone number is valid
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ForgotPasswordConfirmOTPScreen()),
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
                // Using the AuthHeader component with custom button colors
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
                  leftButtonColor: Colors.white.withOpacity(0.5), // White with 50% transparency
                  rightButtonColor: Colors.white.withOpacity(0.5), // White with 50% transparency
                ),
                SizedBox(height: 40),
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(9),
                  ],
                  decoration: InputDecoration(
                    labelText: 'Telefon raqamingizni kiriting',
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
                    prefixText: _countryCode,
                    prefixStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 15.5,
                    ),
                    errorText: _phoneError,
                  ),
                  cursorColor: Color(0xFF112299),
                  style: TextStyle(
                    fontSize: 16.0,
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
          text: 'Davom etish',
          onPressed: _validatePhoneNumber,
        ),
      ),
    );
  }
}
