import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode appTheme = ThemeMode.light;
 
  ThemeProvider() {
    loadTheme();
  }
  void changeTheme(ThemeMode newTheme) {
    if (appTheme == newTheme) {
      return;
    } else {
      appTheme = newTheme;
    }
    notifyListeners();
  } Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeString = prefs.getString('themeMode');
    if (themeString == 'light') {
      appTheme = ThemeMode.light;
    } else if (themeString == 'dark') {
      appTheme = ThemeMode.dark;
    } else {
      appTheme = ThemeMode.light;
    }
    notifyListeners();
  }
}
