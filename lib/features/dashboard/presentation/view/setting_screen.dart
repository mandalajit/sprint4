import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkModeEnabled = false;
  bool _notificationsEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              title: const Text('Dark mode'),
              value: _darkModeEnabled,
              onChanged: (bool value) {
                setState(() {
                  _darkModeEnabled = value;
                  // Apply dark mode changes here
                  if (_darkModeEnabled) {
                    ThemeManager.setDarkMode();
                  } else {
                    ThemeManager.setLightMode();
                  }
                });
              },
            ),
            SwitchListTile(
              title: const Text('Notifications'),
              value: _notificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ThemeManager {
  static setDarkMode() {
    final themeData = ThemeData.dark();
    _setTheme(themeData);
  }

  static setLightMode() {
    final themeData = ThemeData.light();
    _setTheme(themeData);
  }

  static _setTheme(ThemeData themeData) {
    final MaterialApp app = MaterialApp(
      theme: themeData,
    );
    runApp(app);
  }
}
