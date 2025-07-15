import 'package:eventapp/Utilis/app_color.dart';
import 'package:eventapp/Utilis/app_style.dart';
import 'package:flutter/material.dart';
// import 'package:islamy_app/Utils/app_color.dart';

class AppTheme {
  static ThemeData lightMode = ThemeData(
      primaryColor: AppColor.primaryLightColor,
      scaffoldBackgroundColor: AppColor.whiteColor,
      textTheme: TextTheme(headlineLarge: AppStyle.bold20black),
      bottomAppBarTheme: BottomAppBarTheme(
        
        color: AppColor.primaryLightColor),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: AppStyle.bold12white,
        unselectedLabelStyle: AppStyle.bold12white,
        backgroundColor: AppColor.transparentColor,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColor.primaryLightColor,
        foregroundColor: AppColor.whiteColor,
      ));
  static ThemeData darkMode = ThemeData(
      primaryColor: AppColor.primaryDarkColor,
      scaffoldBackgroundColor: AppColor.primaryDarkColor,
      textTheme: TextTheme(headlineLarge: AppStyle.bold20white),
      bottomAppBarTheme: BottomAppBarTheme(color: AppColor.primaryDarkColor),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColor.transparentColor,
        selectedLabelStyle: AppStyle.bold12white,
        showUnselectedLabels: true,
        unselectedLabelStyle: AppStyle.bold12white,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColor.primaryDarkColor,
        foregroundColor: AppColor.whiteColor,
      ));
}
