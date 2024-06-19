import 'package:flutter/material.dart';
import 'package:recipe/screen/login_screen.dart';
import 'package:recipe/screen/splash_screen.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
