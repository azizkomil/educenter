import 'package:flutter/material.dart';
import 'login_form.dart';
import 'signup_form.dart';
import 'toggle_buttons.dart';
import 'logo_and_title.dart';
import 'package:educenter/components/buttons/main_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _loginPhoneController = TextEditingController();
  final TextEditingController _loginPasswordController = TextEditingController();
  final TextEditingController _signupFullNameController = TextEditingController();
  final TextEditingController _signupPhoneController = TextEditingController();
  final TextEditingController _signupPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isLogin = true;
  bool _obscureLoginPassword = true;
  bool _obscureSignupPassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LogoAndTitle(),
                SizedBox(height: 20),
                ToggleButtonsWidget(
                  isLogin: _isLogin,
                  onLoginPressed: () {
                    setState(() {
                      _isLogin = true;
                      _signupFullNameController.clear();
                      _signupPhoneController.clear();
                      _signupPasswordController.clear();
                      _confirmPasswordController.clear();
                    });
                  },
                  onSignupPressed: () {
                    setState(() {
                      _isLogin = false;
                      _loginPhoneController.clear();
                      _loginPasswordController.clear();
                    });
                  },
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Center(
                    child: _isLogin
                        ? LoginForm(
                            phoneController: _loginPhoneController,
                            passwordController: _loginPasswordController,
                            obscurePassword: _obscureLoginPassword,
                            onPasswordVisibilityChanged: (bool value) {
                              setState(() {
                                _obscureLoginPassword = value;
                              });
                            },
                          )
                        : SignupForm(
                            fullNameController: _signupFullNameController,
                            phoneController: _signupPhoneController,
                            passwordController: _signupPasswordController,
                            confirmPasswordController: _confirmPasswordController,
                            obscurePassword: _obscureSignupPassword,
                            obscureConfirmPassword: _obscureConfirmPassword,
                            onPasswordVisibilityChanged: (bool value) {
                              setState(() {
                                _obscureSignupPassword = value;
                              });
                            },
                            onConfirmPasswordVisibilityChanged: (bool value) {
                              setState(() {
                                _obscureConfirmPassword = value;
                              });
                            },
                          ),
                  ),
                ),
                SizedBox(height: 20),
                MainButton(
                  text: _isLogin ? 'Kirish' : 'Davom etish',
                  onPressed: () {
                    // Handle login or register logic
                  },
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
