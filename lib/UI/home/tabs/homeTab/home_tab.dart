import 'package:eventapp/UI/home/Event%20Details/event_details_screen.dart';
import 'package:eventapp/UI/home/tabs/homeTab/event_items.dart';
import 'package:eventapp/UI/home/tabs/homeTab/event_tab_item.dart';
import 'package:eventapp/Utilis/app_assets.dart';
import 'package:eventapp/Utilis/app_color.dart';
import 'package:eventapp/Utilis/app_style.dart';
import 'package:eventapp/providers/eventlist_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late EventListProvider eventListProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      eventListProvider.selectedIndex == 0
          ? eventListProvider.getAllEvent()
          : eventListProvider.getFilteredEventFromFireStore();
    });
  }

  @override
  Widget build(BuildContext context) {
    eventListProvider = Provider.of<EventListProvider>(context);
    eventListProvider.geteventNameList(context);
    if (eventListProvider.eventList.isEmpty) {
      eventListProvider.getAllEvent();
    }

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

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
                  length: eventListProvider.eventNameList.length,
                  child: TabBar(
                    onTap: (index) {
                      eventListProvider.ChangeSelectedIndex(index);
                    },
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    labelPadding: EdgeInsets.zero,
                    indicatorColor: AppColor.transparentColor,
                    dividerColor: AppColor.transparentColor,
                    tabs: eventListProvider.eventNameList
                        .map((eventName) => EventTabItem(
                              selectedTextStyle:
                                  Theme.of(context).textTheme.bodySmall,
                              unSelectedTextStyle:
                                  Theme.of(context).textTheme.bodyMedium,
                              selectedGgColor: AppColor.whiteColor,
                              eventName: eventName,
                              isSelected: eventListProvider.selectedIndex ==
                                  eventListProvider.eventNameList
                                      .indexOf(eventName),
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
              child: eventListProvider.filterEventList.isEmpty
                  ? Center(
                      child: Text(
                        AppLocalizations.of(context)!.no_events_found,
                        style: AppStyle.bold20primary,
                      ),
                    )
                  : ListView.builder(
                      itemCount: eventListProvider.filterEventList.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EventDetailsScreen( 
                                event: eventListProvider.filterEventList[index],
                              ),
                            ),
                          );
                        },
                        child: EventItem(
                          event: eventListProvider.filterEventList[index],
                        ),
                      ),
                    ))
        ],
      ),
    );
  }
}
