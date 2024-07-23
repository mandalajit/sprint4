import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
// library my_library;

// import 'dart:io';
// part 'part_file.dart';

// // other code
// library my_library;

// Move import here
// part 'part_file.dart';

// other code

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await HiveService().init();

  runApp(
    const ProviderScope(child: App()),
  );
}
