import 'package:eventapp/Utilis/app_style.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'package:eventapp/providers/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeSheet extends StatelessWidget {
  ThemeSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var themeprovider = Provider.of<ThemeProvider>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text(
            AppLocalizations.of(context)!.light,
            style: themeprovider.appTheme == ThemeMode.light
                ? AppStyle.bold20primary
                : AppStyle.bold20black,
          ),
          onTap: () async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('themeMode', 'light'); // Use 'light' not localized string
  themeprovider.changeTheme(ThemeMode.light);
  Navigator.pop(context);
},
          trailing: themeprovider.appTheme == ThemeMode.light
              ? Icon(Icons.check_circle, color: Colors.green)
              : SizedBox(),
        ),
        ListTile(
          title: Text(
            AppLocalizations.of(context)!.dark,
            style: themeprovider.appTheme == ThemeMode.dark
                ? AppStyle.bold20primary
                : AppStyle.bold20black,
          ),
          onTap: () async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('themeMode', 'dark'); // Use 'dark' not localized string
  themeprovider.changeTheme(ThemeMode.dark);
  Navigator.pop(context);
},
          trailing: themeprovider.appTheme == ThemeMode.dark
              ? Icon(Icons.check_circle, color: Colors.green)
              : SizedBox(),
        ),
        Spacer()
      ],
    );
  }
}
