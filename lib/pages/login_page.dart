// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'signup_screen.dart';
// import 'forgot_password_page.dart'; 

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   bool _isPasswordVisible = false;
//   bool _rememberMe = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 197, 185, 211), // Base purple background
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Container(
//             decoration: BoxDecoration(
//               color: const Color(0xFFEBE3F5), // Lighter purple
//               borderRadius: BorderRadius.circular(18.0),
//             ),
//             child: Center(
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
//                 child: Container(
//                   padding: const EdgeInsets.all(24.0),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20.0),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.05),
//                         spreadRadius: 2,
//                         blurRadius: 10,
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       // Welcome Back Title
//                       const Text(
//                         'Welcome Back',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 28,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 8),

//                       // Subtitle
//                       const Text(
//                         'Sign in to your account to continue',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 16,
//                         ),
//                       ),
//                       const SizedBox(height: 40),

//                       // Email Text Field
//                       TextField(
//                         keyboardType: TextInputType.emailAddress,
//                         decoration: InputDecoration(
//                           labelText: 'Email address',
//                           prefixIcon: const Icon(Icons.email_outlined),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                             borderSide: const BorderSide(color: Colors.grey),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20),

//                       // Password Text Field
//                       TextField(
//                         obscureText: !_isPasswordVisible,
//                         decoration: InputDecoration(
//                           labelText: 'Password',
//                           prefixIcon: const Icon(Icons.lock_outline),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                             borderSide: const BorderSide(color: Colors.grey),
//                           ),
//                           suffixIcon: IconButton(
//                             icon: Icon(
//                               _isPasswordVisible
//                                   ? Icons.visibility_off_outlined
//                                   : Icons.visibility_outlined,
//                             ),
//                             onPressed: () {
//                               setState(() {
//                                 _isPasswordVisible = !_isPasswordVisible;
//                               });
//                             },
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20),

//                       // Remember Me & Forgot Password
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               Checkbox(
//                                 value: _rememberMe,
//                                 onChanged: (bool? value) {
//                                   setState(() {
//                                     _rememberMe = value ?? false;
//                                   });
//                                 },
//                               ),
//                               const Text('Remember me'),
//                             ],
//                           ),
//                           TextButton(
//                             // 2. Add navigation logic here
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(builder: (context) => const ForgotPasswordPage()),
//                               );
//                             },
//                             child: const Text(
//                               'Forgot Password?',
//                               style: TextStyle(color: Color(0xFF8A6AED)),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20),

//                       // Sign In Button (with gradient)
//                       Container(
//                         decoration: BoxDecoration(
//                           gradient: const LinearGradient(
//                             colors: [Color(0xFF785CCB), Color(0xFFABA0F9)],
//                             begin: Alignment.centerLeft,
//                             end: Alignment.centerRight,
//                           ),
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: ElevatedButton(
//                           onPressed: () {},
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.transparent,
//                             shadowColor: Colors.transparent,
//                             padding: const EdgeInsets.symmetric(vertical: 16),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                           ),
//                           child: const Text(
//                             'Sign In',
//                             style: TextStyle(fontSize: 18, color: Colors.white),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 30),

//                       // "Or continue with" Divider
//                       const Row(
//                         children: [
//                           Expanded(child: Divider()),
//                           Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 8.0),
//                             child: Text('Or continue with', style: TextStyle(color: Colors.grey)),
//                           ),
//                           Expanded(child: Divider()),
//                         ],
//                       ),
//                       const SizedBox(height: 30),

//                       // Social Login Buttons
//                       _buildSocialButton(
//                         icon: FontAwesomeIcons.github,
//                         label: 'Continue with GitHub',
//                         onPressed: () {},
//                       ),
//                       const SizedBox(height: 12),
//                       _buildSocialButton(
//                         icon: FontAwesomeIcons.linkedinIn,
//                         label: 'Continue with LinkedIn',
//                         onPressed: () {},
//                       ),
//                       const SizedBox(height: 12),
//                       _buildSocialButton(
//                         icon: FontAwesomeIcons.google,
//                         label: 'Continue with Google',
//                         onPressed: () {},
//                       ),
//                       const SizedBox(height: 40),

//                       // Sign Up Text (Navigates to SignUpPage)
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Text("Don't have an account? "),
//                           TextButton(
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(builder: (context) => const SignUpPage()),
//                               );
//                             },
//                             child: const Text(
//                               'Sign Up',
//                               style: TextStyle(
//                                 color: Color(0xFF8A6AED),
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // Helper widget for building social login buttons
//   Widget _buildSocialButton({
//     required IconData icon,
//     required String label,
//     required VoidCallback onPressed,
//   }) {
//     return OutlinedButton.icon(
//       icon: FaIcon(icon, size: 20),
//       onPressed: onPressed,
//       label: Text(label),
//       style: OutlinedButton.styleFrom(
//         padding: const EdgeInsets.symmetric(vertical: 14),
//         foregroundColor: Colors.black87,
//         side: BorderSide(color: Colors.grey.shade300),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//       ),
//     );
//   }
// }