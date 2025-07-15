import 'package:eventapp/UI/home/home_screen.dart';
import 'package:eventapp/UI/onboarding/intro_screan.dart';
import 'package:eventapp/Utilis/app_routes.dart';
import 'package:eventapp/Utilis/app_theme.dart';
import 'package:eventapp/providers/language_provider.dart';
import 'package:eventapp/providers/theme_provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => LanguageProvider()),
    // add other providers here
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var languageprovider = Provider.of<LanguageProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(
        languageprovider.selectedLanguage,
      ),
      initialRoute: AppRoutes.homeRouteName,
      routes: {
        AppRoutes.homeRouteName: (context) => HomeScreen(),
        AppRoutes.introRouteName: (context) => IntrodactionScrean(),
      },
      theme: AppTheme.lightMode,
      darkTheme: AppTheme.darkMode,
      themeMode:
          //  ThemeMode.dark
          themeProvider.appTheme,
    );
  }
}
