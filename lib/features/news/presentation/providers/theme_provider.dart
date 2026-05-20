import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'theme_provider.g.dart';

@riverpod
class ThemeController extends _$ThemeController {
  static const _boxName = 'settings';
  static const _themeKey = 'dark_mode';

  @override
  ThemeMode build() {
    final box = Hive.box(_boxName);
    final isDark = box.get(_themeKey, defaultValue: false);
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void toggleTheme() {
    final box = Hive.box(_boxName);
    final isDark = state == ThemeMode.dark;
    box.put(_themeKey, !isDark);
    state = !isDark ? ThemeMode.dark : ThemeMode.light;
  }
}
