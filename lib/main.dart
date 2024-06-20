import 'package:flutter/material.dart';
import 'package:recipe/core/networking/local/hive_service.dart';

import 'app/app.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService().init();
  runApp(const App());
}

