// import 'package:flutter/material.dart';
// import 'package:educenter/components/buttons/main_button.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _loginPhoneController = TextEditingController();
//   final TextEditingController _loginPasswordController = TextEditingController();
//   final TextEditingController _signupFullNameController = TextEditingController();
//   final TextEditingController _signupPhoneController = TextEditingController();
//   final TextEditingController _signupPasswordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();
  
//   bool _isLogin = true; // To toggle between login and register
//   bool _obscureLoginPassword = true; // To toggle login password visibility
//   bool _obscureSignupPassword = true; // To toggle signup password visibility
//   bool _obscureConfirmPassword = true; // To toggle confirm password visibility

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               SizedBox(height: 30),

//               // Logo and Title in Row
//               Row(
//                 children: [
//                   Image.asset(
//                     'lib/images/logo.png', // Corrected path to the logo
//                     height: 110,
//                   ),
//                   SizedBox(width: 10),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         '''Kiberxavfsizlik 
// Markazi''',
//                         style: TextStyle(
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold,
//                           color: Color(0xFF3B2F88), // Matching the color
//                         ),
//                       ),
//                       Text(
//                         'o\'quv platformasiga hush kelibsiz!',
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Color(0xFF3B2F88),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),

//               SizedBox(height: 20),

//               // Login/Register Toggle Buttons
//               Container(
//                 height: 70,
//                 child: Stack(
//                   children: [
//                     // Background Container that spans the full width
//                     Positioned.fill(
//                       child: Container(
//                         color: Color(0xFF5039B3),  // Blue background color
//                       ),
//                     ),
//                     Center(  // Center the Row within the Container
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,  // Adjusts Row width to its contents
//                         children: [
//                           Expanded(
//                             child: TextButton(
//                               onPressed: () {
//                                 setState(() {
//                                   _isLogin = true;
//                                   // Clear sign-up fields when switching to login
//                                   _signupFullNameController.clear();
//                                   _signupPhoneController.clear();
//                                   _signupPasswordController.clear();
//                                   _confirmPasswordController.clear();
//                                 });
//                               },
//                               style: TextButton.styleFrom(
//                                 padding: EdgeInsets.symmetric(vertical: 15),
//                                 backgroundColor: Colors.transparent,
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   'Tizimga kirish',
//                                   style: TextStyle(
//                                     color: _isLogin ? Colors.white.withOpacity(1.0) : Colors.white.withOpacity(0.5),  // Full white when selected, 50% white when not
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             child: TextButton(
//                               onPressed: () {
//                                 setState(() {
//                                   _isLogin = false;
//                                   // Clear login fields when switching to sign-up
//                                   _loginPhoneController.clear();
//                                   _loginPasswordController.clear();
//                                 });
//                               },
//                               style: TextButton.styleFrom(
//                                 padding: EdgeInsets.symmetric(vertical: 15),
//                                 backgroundColor: Colors.transparent,
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   "Ro'yxatdan o'tish",
//                                   style: TextStyle(
//                                     color: !_isLogin ? Colors.white.withOpacity(1.0) : Colors.white.withOpacity(0.5),  // Full white when selected, 50% white when not
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               SizedBox(height: 20),

//               // Centered Input Fields (Changes based on _isLogin)
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: _isLogin ? _buildLoginForm() : _buildRegisterForm(),
//                 ),
//               ),

//               // Login/Register Button at the Bottom
//               MainButton(
//                 text: _isLogin ? 'Kirish' : 'Davom etish',
//                 onPressed: () {
//                   // Handle login or register logic
//                 },
//               ),
//               SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Login Form
//   List<Widget> _buildLoginForm() {
//     return [
//       // Phone Number Input
//       TextField(
//         controller: _loginPhoneController,
//         keyboardType: TextInputType.phone,
//         decoration: InputDecoration(
//           labelText: 'Telefon raqam',
//           labelStyle: TextStyle(
//             color: Color(0xFF868686),
//             fontWeight: FontWeight.bold,
//           ),
//           enabledBorder: UnderlineInputBorder(
//             borderSide: BorderSide(color: Color(0xFF3B2F88)),
//           ),
//           focusedBorder: UnderlineInputBorder(
//             borderSide: BorderSide(color: Color(0xFF3B2F88), width: 2),
//           ),
//         ),
//       ),
//       SizedBox(height: 20),

//       // Password Input
//       TextField(
//         controller: _loginPasswordController,
//         obscureText: _obscureLoginPassword,
//         decoration: InputDecoration(
//           labelText: 'Parolingizni kiriting',
//           labelStyle: TextStyle(
//             color: Color(0xFF868686),
//             fontWeight: FontWeight.bold,
//           ),
//           enabledBorder: UnderlineInputBorder(
//             borderSide: BorderSide(color: Color(0xFF3B2F88)),
//           ),
//           focusedBorder: UnderlineInputBorder(
//             borderSide: BorderSide(color: Color(0xFF3B2F88), width: 2),
//           ),
//           suffixIcon: IconButton(
//             icon: Icon(
//               _obscureLoginPassword ? Icons.visibility : Icons.visibility_off,
//               color: const Color.fromARGB(255, 59, 47, 136),
//             ),
//             onPressed: () {
//               setState(() {
//                 _obscureLoginPassword = !_obscureLoginPassword;
//               });
//             },
//           ),
//         ),
//       ),

//       SizedBox(height: 10),

//       // Forgot Password
//       Center(
//         child: TextButton(
//           onPressed: () {
//             // Forgot password logic
//           },
//           child: Text(
//             'Parolni unutdingizmi?',
//             style: TextStyle(
//               color: Color(0xFF3B2F88),
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//       ),
//     ];
//   }

//   // Register Form
//   List<Widget> _buildRegisterForm() {
//     return [
//       // Full Name Input
//       TextField(
//         controller: _signupFullNameController,
//         decoration: InputDecoration(
//           labelText: 'To\'liq ismingizni kiriting',
//           labelStyle: TextStyle(
//             color: Color(0xFF868686),
//             fontWeight: FontWeight.bold,
//           ),
//           enabledBorder: UnderlineInputBorder(
//             borderSide: BorderSide(color: Color(0xFF3B2F88)),
//           ),
//           focusedBorder: UnderlineInputBorder(
//             borderSide: BorderSide(color: Color(0xFF3B2F88), width: 2),
//           ),
//         ),
//       ),
//       SizedBox(height: 20),

//       // Phone Number Input
//       TextField(
//         controller: _signupPhoneController,
//         keyboardType: TextInputType.phone,
//         decoration: InputDecoration(
//           labelText: 'Telefon raqamingizni kiriting',
//           labelStyle: TextStyle(
//             color: Color(0xFF868686),
//             fontWeight: FontWeight.bold,
//           ),
//           enabledBorder: UnderlineInputBorder(
//             borderSide: BorderSide(color: Color(0xFF3B2F88)),
//           ),
//           focusedBorder: UnderlineInputBorder(
//             borderSide: BorderSide(color: Color(0xFF3B2F88), width: 2),
//           ),
//         ),
//       ),
//       SizedBox(height: 20),

//       // Set Password Input
//       TextField(
//         controller: _signupPasswordController,
//         obscureText: _obscureSignupPassword,
//         decoration: InputDecoration(
//           labelText: 'Parol kiriting',
//           labelStyle: TextStyle(
//             color: Color(0xFF868686),
//             fontWeight: FontWeight.bold,
//           ),
//           enabledBorder: UnderlineInputBorder(
//             borderSide: BorderSide(color: Color(0xFF3B2F88)),
//           ),
//           focusedBorder: UnderlineInputBorder(
//             borderSide: BorderSide(color: Color(0xFF3B2F88), width: 2),
//           ),
//           suffixIcon: IconButton(
//             icon: Icon(
//               _obscureSignupPassword ? Icons.visibility : Icons.visibility_off,
//               color: const Color.fromARGB(255, 59, 47, 136),
//             ),
//             onPressed: () {
//               setState(() {
//                 _obscureSignupPassword = !_obscureSignupPassword;
//               });
//             },
//           ),
//         ),
//       ),
//       SizedBox(height: 20),

//       // Confirm Password Input
//       TextField(
//         controller: _confirmPasswordController,
//         obscureText: _obscureConfirmPassword,
//         decoration: InputDecoration(
//           labelText: 'Parolni tasdiqlang',
//           labelStyle: TextStyle(
//             color: Color(0xFF868686),
//             fontWeight: FontWeight.bold,
//           ),
//           enabledBorder: UnderlineInputBorder(
//             borderSide: BorderSide(color: Color(0xFF3B2F88)),
//           ),
//           focusedBorder: UnderlineInputBorder(
//             borderSide: BorderSide(color: Color(0xFF3B2F88), width: 2),
//           ),
//           suffixIcon: IconButton(
//             icon: Icon(
//               _obscureConfirmPassword ? Icons.visibility : Icons.visibility_off,
//               color: const Color.fromARGB(255, 59, 47, 136),
//             ),
//             onPressed: () {
//               setState(() {
//                 _obscureConfirmPassword = !_obscureConfirmPassword;
//               });
//             },
//           ),
//         ),
//       ),
//     ];
//   }
// }
