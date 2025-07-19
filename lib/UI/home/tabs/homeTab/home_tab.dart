import 'package:eventapp/UI/home/tabs/homeTab/event_items.dart';
import 'package:eventapp/UI/home/tabs/homeTab/event_tab_item.dart';
import 'package:eventapp/Utilis/app_assets.dart';
import 'package:eventapp/Utilis/app_color.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex = 0;
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

    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40))),
        backgroundColor: Theme.of(context).copyWith().primaryColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back ✨',
              style: Theme.of(context).copyWith().textTheme.bodyMedium,
            ),
            Text('John Safwat',
                style: Theme.of(context).copyWith().textTheme.displayLarge)
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.sunny, color: AppColor.whiteColor)),
          IconButton(onPressed: () {}, icon: Image.asset(AppAsset.eN)),
          SizedBox(width: width * .04)
        ],
        bottom: AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          toolbarHeight: height * 0.1,
          backgroundColor: Theme.of(context).copyWith().primaryColor,
          title: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.location_on_outlined,
                      color: Theme.of(context).secondaryHeaderColor),
                  Text(
                    'Cairo, Egypt',
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
              SizedBox(
                height: height * 0.015,
              ),
              DefaultTabController(
                  length: eventNameList.length,
                  child: TabBar(
                    onTap: (index) {
                      selectedIndex = index;
                      setState(() {});
                    },
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    labelPadding: EdgeInsets.zero,
                    indicatorColor: AppColor.transparentColor,
                    dividerColor: AppColor.transparentColor,
                    tabs: eventNameList
                        .map((eventName) => EventTabItem(
                              eventName: eventName,
                              isSelected: selectedIndex ==
                                  eventNameList.indexOf(eventName),
                            ))
                        .toList(),
                  ))
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) => EventItem(), itemCount: 3))
        ],
      ),
    );
  }
}
