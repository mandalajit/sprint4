import 'package:flutter/material.dart';
import 'package:recipe/screen/dashboard_screen.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DashBoardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
