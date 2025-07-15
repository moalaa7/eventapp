import 'package:eventapp/Utilis/app_assets.dart';
import 'package:eventapp/Utilis/app_color.dart';
import 'package:eventapp/Utilis/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:eventapp/providers/language_provider.dart';

class IntrodactionScrean extends StatelessWidget {
  const IntrodactionScrean({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(AppAsset.intrologo),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            Image.asset(
              AppAsset.introbgimg,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              "Personalize Your Experience",
              style: AppStyle.bold20primary,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.',
              style: AppStyle.bold16black,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            ListTile(
                title: Text(
                  AppLocalizations.of(context)!.language,
                  style: AppStyle.bold20primary,
                ),
                trailing: Container(
                  width: width * 0.5,
                  child: Row(
                    children: [
                      ImageIcon(
                        AssetImage(AppAsset.eg),
                      ),
                      ImageIcon(AssetImage(AppAsset.us)),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
