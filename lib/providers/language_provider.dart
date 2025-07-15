import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String selectedLanguage = 'en';

  void changeLanguage(String newLanguage) {
    if (selectedLanguage == newLanguage) {
      return;
    } else {
      selectedLanguage = newLanguage;
    }
    notifyListeners();
  }
}
