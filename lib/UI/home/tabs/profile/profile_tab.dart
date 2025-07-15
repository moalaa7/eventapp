import 'package:eventapp/UI/home/tabs/profile/language_sheet.dart';
import 'package:eventapp/UI/home/tabs/profile/theme_sheet%20.dart';
import 'package:eventapp/Utilis/app_assets.dart';
import 'package:eventapp/Utilis/app_color.dart';
import 'package:eventapp/Utilis/app_style.dart';
import 'package:eventapp/providers/language_provider.dart';
import 'package:eventapp/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageprovider = Provider.of<LanguageProvider>(context);
    var themeprovider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryLightColor,
        toolbarHeight: height * 0.2,
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Image.asset(AppAsset.routelogo),
              SizedBox(width: width * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'John Safwat',
                    style: AppStyle.bold24white,
                  ),
                  Text(
                    'johnsafwat.route@gmail.com',
                    style: AppStyle.bold16white,
                  ),
                ],
              )
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Container(
              margin:
                  EdgeInsets.only(top: height * 0.02, bottom: height * 0.02),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColor.primaryLightColor,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                onTap: () {
                  showLanguageButtomSheet(context);
                  // Handle language selection
                },
                title: Text(
                  languageprovider.selectedLanguage == 'en'
                      ? AppLocalizations.of(context)!.english
                      : AppLocalizations.of(context)!.arabic,
                  style: AppStyle.bold20primary,
                ),
                trailing: Icon(
                  Icons.arrow_drop_down_rounded,
                  size: 40,
                  color: AppColor.primaryLightColor,
                ),
              ),
              // child: Text(
              //   'English',
              //   style: AppStyle.bold20primary,
              // ),
            ),
            Text(
              AppLocalizations.of(context)!.theme,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Container(
              margin:
                  EdgeInsets.only(top: height * 0.02, bottom: height * 0.02),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColor.primaryLightColor,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return ThemeSheet();
                    },
                  );
                  // Handle theme selection
                },
                title: Text(
                  themeprovider.appTheme == ThemeMode.light
                      ? AppLocalizations.of(context)!.light
                      : AppLocalizations.of(context)!.dark,
                  style: AppStyle.bold20primary,
                ),
                trailing: Icon(
                  Icons.arrow_drop_down_rounded,
                  size: 40,
                  color: AppColor.primaryLightColor,
                ),
              ),
              // child: Text(
              //   'English',
              //   style: AppStyle.bold20primary,
              // ),
            ),
            Spacer(),
            ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              tileColor: AppColor.redColor,
              title: Text(
                'Logout',
                style: AppStyle.bold20white,
              ),
              leading: Icon(
                Icons.exit_to_app,
                size: 35,
                color: AppColor.whiteColor,
              ),
            )
          ],
        ),
      ),
    );
  }

  showLanguageButtomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return LanguageSheet();
      },
    );
  }
}
