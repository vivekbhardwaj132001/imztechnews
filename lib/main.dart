import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Environment Variables
  await dotenv.load(fileName: ".env");

  // Initialize Local Database
  await Hive.initFlutter();
  await Hive.openBox('articles_box');
  await Hive.openBox('bookmarks_box');
  await Hive.openBox('settings');

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
