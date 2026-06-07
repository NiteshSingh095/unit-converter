import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  static const _themeKey = 'theme_mode';

  final Rx<ThemeMode> themeMode = ThemeMode.light.obs;

  Future<ThemeController> init() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_themeKey);
    if (saved == 'dark') {
      themeMode.value = ThemeMode.dark;
    } else {
      themeMode.value = ThemeMode.light;
    }
    return this;
  }

  bool get isDark => themeMode.value == ThemeMode.dark;

  Future<void> toggleTheme() async {
    themeMode.value = isDark ? ThemeMode.light : ThemeMode.dark;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, isDark ? 'dark' : 'light');
    Get.changeThemeMode(themeMode.value);
  }
}
