import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventapp/UI/Authentication/login.dart';
import 'package:eventapp/UI/Authentication/signup.dart';
import 'package:eventapp/UI/home/Add%20Event/add_event.dart';
import 'package:eventapp/UI/home/home_screen.dart';
import 'package:eventapp/UI/onboarding/intro_screan.dart';
import 'package:eventapp/Utilis/app_routes.dart';
import 'package:eventapp/Utilis/app_theme.dart';
import 'package:eventapp/firebase_options.dart';
import 'package:eventapp/providers/eventlist_provider.dart';
import 'package:eventapp/providers/language_provider.dart';
import 'package:eventapp/providers/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.disableNetwork();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => LanguageProvider()),
    ChangeNotifierProvider(create: (context) => EventListProvider()),
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
      initialRoute: AppRoutes.loginRouteName,
      routes: {
        AppRoutes.loginRouteName: (context) => Login(),
        AppRoutes.signupRouteName: (context) => Signup(),
        AppRoutes.homeRouteName: (context) => HomeScreen(),
        AppRoutes.introRouteName: (context) => IntrodactionScrean(),
        AppRoutes.addEventRouteName: (context) => AddEvent(),
      },
      theme: AppTheme.lightMode,
      darkTheme: AppTheme.darkMode,
      themeMode:
          //  ThemeMode.dark
          themeProvider.appTheme,
    );
  }
}
