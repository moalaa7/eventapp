import 'package:eventapp/Utilis/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:eventapp/providers/language_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageSheet extends StatelessWidget {
  LanguageSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var languageprovider = Provider.of<LanguageProvider>(context);
    return
        // padding: EdgeInsets.all(16),
        Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text(
            AppLocalizations.of(context)!.english,
            style: languageprovider.selectedLanguage == 'en'
                ? AppStyle.bold20primary
                : AppStyle.bold20black,
          ),
          onTap: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString(
                'language', 'en'); // Use 'dark' not localized string
            languageprovider.changeLanguage('en');
            Navigator.pop(context);
          },
          trailing: languageprovider.selectedLanguage == 'en'
              ? Icon(Icons.check_circle, color: Colors.green)
              : SizedBox(),
        ),
        ListTile(
          title: Text(
            AppLocalizations.of(context)!.arabic,
            style: languageprovider.selectedLanguage == 'ar'
                ? AppStyle.bold20primary
                : AppStyle.bold20black,
          ),
          trailing: languageprovider.selectedLanguage == 'ar'
              ? Icon(Icons.check_circle, color: Colors.green)
              : SizedBox(),
          onTap: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString(
                'language', 'ar'); // Use 'dark' not localized string
            languageprovider.changeLanguage('ar');
            Navigator.pop(context);
          },
        ),
        Spacer()
      ],
    );
  }
}
