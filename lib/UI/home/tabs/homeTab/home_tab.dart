import 'package:eventapp/UI/home/tabs/homeTab/event_tab_item.dart';
import 'package:eventapp/Utilis/app_assets.dart';
import 'package:eventapp/Utilis/app_color.dart';
import 'package:eventapp/Utilis/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    List<String> eventNameList = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meating,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.workshop,
      AppLocalizations.of(context)!.book_club,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.eating,
    ];
    List<String> iconNameList = [
      AppAsset.eN,
      AppAsset.eN,
      AppAsset.eN,
      AppAsset.eN,
      AppAsset.eN,
      AppAsset.eN,
      AppAsset.eN,
      AppAsset.eN,
      AppAsset.eN,
      AppAsset.eN,
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).copyWith().primaryColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back ✨',
              style: AppStyle.bold14white,
            ),
            Text(
              'John Safwat',
              style: AppStyle.bold24white,
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.sunny, color: AppColor.whiteColor)),
          Image.asset(AppAsset.eN)
        ],
        bottom: AppBar(
          backgroundColor: Theme.of(context).copyWith().primaryColor,
          title: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.location_on_outlined, color: AppColor.whiteColor),
                  Text(
                    'Cairo, Egypt',
                    style: AppStyle.bold14white,
                  )
                ],
              ),
              DefaultTabController(
                  length: eventNameList.length,
                  child: TabBar(tabs: [
                    EventTabItem(
                        iconName: iconNameList[0], eventName: eventNameList[0]),
                         EventTabItem(
                        iconName: iconNameList[0], eventName: eventNameList[0]), EventTabItem(
                        iconName: iconNameList[0], eventName: eventNameList[0]), EventTabItem(
                        iconName: iconNameList[0], eventName: eventNameList[0]), EventTabItem(
                        iconName: iconNameList[0], eventName: eventNameList[0]), EventTabItem(
                        iconName: iconNameList[0], eventName: eventNameList[0]), EventTabItem(
                        iconName: iconNameList[0], eventName: eventNameList[0]), EventTabItem(
                        iconName: iconNameList[0], eventName: eventNameList[0]), EventTabItem(
                        iconName: iconNameList[0], eventName: eventNameList[0]), EventTabItem(
                        iconName: iconNameList[0], eventName: eventNameList[0]),
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
