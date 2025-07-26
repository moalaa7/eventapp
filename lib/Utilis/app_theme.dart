import 'package:eventapp/Utilis/app_color.dart';
import 'package:eventapp/Utilis/app_style.dart';
import 'package:flutter/material.dart';
// import 'package:islamy_app/Utils/app_color.dart';

class AppTheme {
  static ThemeData lightMode = ThemeData(
      canvasColor: AppColor.whiteColor,
      secondaryHeaderColor: AppColor.whiteColor,
      primaryColor: AppColor.primaryLightColor,
      scaffoldBackgroundColor: AppColor.whiteColor,
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: AppColor.primaryLightColor)),
      ////////////////////////////////
      textTheme: TextTheme(
          displayLarge: AppStyle.bold20white,
          bodyLarge: AppStyle.bold18primary,
          headlineLarge: AppStyle.bold20black,
          bodyMedium: AppStyle.bold14white,
          bodySmall: AppStyle.bold14primary),
      ////////////////////////////////
      bottomAppBarTheme: BottomAppBarTheme(color: AppColor.primaryLightColor),
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
      canvasColor: AppColor.primaryLightColor,
      secondaryHeaderColor: AppColor.secondryDarkColor,
      primaryColor: AppColor.primaryDarkColor,
      scaffoldBackgroundColor: AppColor.primaryDarkColor,
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: AppColor.primaryLightColor)),
      ////////////////////////////////
      textTheme: TextTheme(
          displayLarge: AppStyle.bold20offwhite,
          bodyLarge: AppStyle.bold18offwhite,
          headlineLarge: AppStyle.bold20offwhite,
          bodyMedium: AppStyle.bold14offwhite,
          bodySmall: AppStyle.bold14offwhite),
      ////////////////////////////////
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
