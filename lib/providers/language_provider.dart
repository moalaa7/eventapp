import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  String selectedLanguage = 'en';

  LanguageProvider() {
    loadLanguage();
  }
  void changeLanguage(String newLanguage) {
    if (selectedLanguage == newLanguage) {
      return;
    } else {
      selectedLanguage = newLanguage;
    }
    notifyListeners();
  }
   Future<void> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final lang = prefs.getString('language');
    if (lang != null) {
      selectedLanguage = lang;
      notifyListeners();
    }
  }
}
