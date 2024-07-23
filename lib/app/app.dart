import 'package:flutter/material.dart';
import 'package:recipe/features/recipe_listing/presentation/view/recipe_listing_view.dart';
import 'navigator_key/navigator_key.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppNavigator.navigatorKey,
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
