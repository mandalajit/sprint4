// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'dart:async';

// import 'package:recipe/screen/login_screen.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Simulate a long-running operation such as fetching data or initializing resources
//     Timer(Duration(seconds: 2), () {
//       // After 2 seconds, navigate to the login screen
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => LoginScreen()),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFFEFAE0),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             // Add your splash screen content here, such as a logo or animation
//             Image.asset('assets/images/logo.png'),
//             SizedBox(height: 10.0),
//             RichText(
//               text: TextSpan(
//                 children: [
//                   TextSpan(
//                     text: 'food',
//                     style: TextStyle(
//                       fontSize: 30,
//                       color: Colors.black,
//                     ),
//                   ),
//                   TextSpan(
//                     text: 'recipe',
//                     style: TextStyle(
//                       fontSize: 30,
//                       color: Colors.orange,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
