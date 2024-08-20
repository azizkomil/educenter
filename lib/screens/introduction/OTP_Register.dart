import 'dart:async';

import 'package:educenter/components/auth_header.dart';
import 'package:educenter/components/main_button.dart';
import 'package:educenter/screens/introduction/login.dart';
import 'package:educenter/screens/introduction/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConfirmOTPScreenRegister extends StatefulWidget {
  @override
  _ConfirmOTPScreenRegisterState createState() => _ConfirmOTPScreenRegisterState();
}

class _ConfirmOTPScreenRegisterState extends State<ConfirmOTPScreenRegister> {
  final List<TextEditingController> _otpControllers = List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _otpFocusNodes = List.generate(4, (index) => FocusNode());
  bool _isOTPCorrect = false;
  bool _canResendOTP = false;
  late Timer _timer;
  int _start = 10; // 10 seconds countdown
  String? _otpError; // To store the OTP error message

  @override
  void initState() {
    super.initState();
    _startTimer();
    _otpFocusNodes.asMap().forEach((index, focusNode) {
      focusNode.addListener(() {
        if (!focusNode.hasFocus) {
          setState(() {
            _validateOTP();
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Stop the timer when the screen is disposed
    _otpControllers.forEach((controller) => controller.dispose());
    _otpFocusNodes.forEach((focusNode) => focusNode.dispose());
    super.dispose();
  }

  void _startTimer() {
    _canResendOTP = false;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _canResendOTP = true;
          timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  void _validateOTP() {
    final otp = _otpControllers.map((controller) => controller.text).join();
    setState(() {
      _isOTPCorrect = otp.length == 4 && RegExp(r'^\d{4}$').hasMatch(otp);
    });
  }

  void _checkOTP() {
    final otp = _otpControllers.map((controller) => controller.text).join();
    if (otp != "1111") {
      setState(() {
        _otpError = "Kod noto'g'ri"; // Show error if OTP is incorrect
      });
    } else {
      setState(() {
        _otpError = null; // Clear any previous errors
      });
      // Navigate to the login screen with a success message
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(
            successMessage: 'Siz ro\'yxatdan muvaffaqiyatli o\'tdingiz, iltimos, akkauntingizga kiring!',
          ),
        ),
        (route) => false,
      );
    }
  }

  Widget _buildOTPField(int index) {
    return SizedBox(
      width: 50,
      child: TextField(
        controller: _otpControllers[index],
        focusNode: _otpFocusNodes[index],
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 24,
          color: Color(0xFF112299),
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: _isOTPCorrect || _otpControllers[index].text.isEmpty
                  ? Colors.grey
                  : Colors.red,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: _isOTPCorrect || _otpControllers[index].text.isEmpty
                  ? Color(0xFF112299)
                  : Colors.red,
            ),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 3) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && index > 0) {
            FocusScope.of(context).previousFocus();
          }
          _validateOTP();
        },
      ),
    );
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                  leftButtonColor: Colors.white.withOpacity(0.5),
                  rightButtonColor: Colors.white.withOpacity(0.5),
                ),
                SizedBox(height: 40),
                Center(
                  child: Text(
                    'Raqamni tasdiqlash',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    'Sizning telefon raqamingizga yuborilgan\n4 raqamli kodni kiriting.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) => _buildOTPField(index)),
                ),
                if (_otpError != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Center(
                      child: Text(
                        _otpError!,
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ),
                  ),
                SizedBox(height: 20),
                Center(
                  child: TextButton(
                    onPressed: _canResendOTP
                        ? () {
                            // Handle Resend OTP action
                            print("Resend OTP pressed");
                            setState(() {
                              _start = 10;
                            });
                            _startTimer();
                          }
                        : null,
                    child: _canResendOTP
                        ? Text(
                            "Qayta jo'natish",
                            style: TextStyle(
                              color: Color(0xFF112299),
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Text(
                            "Qayta jo'natish ($_start)",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
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
          text: 'Davom etish',
          onPressed: _isOTPCorrect
              ? _checkOTP // Validate OTP when button is clicked
              : () {}, // Disable by doing nothing if OTP is incorrect
        ),
      ),
    );
  }
}
