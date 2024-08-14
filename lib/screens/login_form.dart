import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Define PhoneNumberFormatter here
class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;
    final newText = _formatPhoneNumber(text);
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }

  String _formatPhoneNumber(String phoneNumber) {
    final digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');
    final buffer = StringBuffer();
    for (int i = 0; i < digitsOnly.length; i++) {
      if (i == 2 || i == 5 || i == 7) buffer.write(' ');
      buffer.write(digitsOnly[i]);
    }
    return buffer.toString();
  }
}

class LoginForm extends StatefulWidget {
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final bool obscurePassword;
  final ValueChanged<bool> onPasswordVisibilityChanged;

  LoginForm({
    required this.phoneController,
    required this.passwordController,
    required this.obscurePassword,
    required this.onPasswordVisibilityChanged,
  });

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;
  late bool _obscurePassword;

  @override
  void initState() {
    super.initState();
    _phoneController = widget.phoneController;
    _passwordController = widget.passwordController;
    _obscurePassword = widget.obscurePassword;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
    widget.onPasswordVisibilityChanged(_obscurePassword);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Phone Number Field
        TextField(
          controller: _phoneController,
          keyboardType: TextInputType.phone,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(9), // Limit to exactly 9 digits
            PhoneNumberFormatter(), // Apply custom formatter
          ],
          decoration: InputDecoration(
            prefix: Text(
              '+998 ',
              style: TextStyle(
                color: Colors.black, // This color should match the user input text color
                fontSize: 16.0, // This size should match the user input text size
                fontWeight: FontWeight.normal, // This ensures the text is not bold
              ),
            ),
            labelText: 'Telefon raqam',
            labelStyle: TextStyle(
              color: Color(0xFF868686),
              fontWeight: FontWeight.bold,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF3B2F88)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF3B2F88), width: 2),
            ),
          ),
        ),
        
        SizedBox(height: 20),
        // Password Field
        TextField(
          controller: _passwordController,
          obscureText: _obscurePassword,
          decoration: InputDecoration(
            labelText: 'Parolingizni kiriting',
            labelStyle: TextStyle(
              color: Color(0xFF868686),
              fontWeight: FontWeight.bold,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF3B2F88)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF3B2F88), width: 2),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? Icons.visibility : Icons.visibility_off,
                color: const Color.fromARGB(255, 59, 47, 136),
              ),
              onPressed: _togglePasswordVisibility,
            ),
          ),
        ),
        SizedBox(height: 10),
        // Forgot Password Button
        Center(
          child: TextButton(
            onPressed: () {
              // Forgot password logic
            },
            child: Text(
              'Parolni unutdingizmi?',
              style: TextStyle(
                color: Color(0xFF3B2F88),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
