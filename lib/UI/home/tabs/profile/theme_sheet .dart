import 'package:eventapp/Utilis/app_style.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'package:eventapp/providers/theme_provider.dart';

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
          onTap: () {
            themeprovider.changeTheme(ThemeMode.light);
            // Handle English selection
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
          onTap: () {
            themeprovider.changeTheme(ThemeMode.dark);
            // Handle English selection
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
