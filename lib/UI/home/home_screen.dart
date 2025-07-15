import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:eventapp/UI/home/tabs/favorite/favorite_tab.dart';
import 'package:eventapp/UI/home/tabs/homeTab/home_tab.dart';
import 'package:eventapp/UI/home/tabs/maps/map_tab.dart';
import 'package:eventapp/UI/home/tabs/profile/profile_tab.dart';
import 'package:eventapp/Utilis/app_assets.dart';
import 'package:eventapp/Utilis/app_color.dart';
import 'package:eventapp/Utilis/app_style.dart';
import 'package:eventapp/Utilis/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    MapTab(),
    FavoriteTab(),
    ProfileTab(),
  ];
  List<String> selectedIconList = [
    AppAsset.selected_home_icon,
    AppAsset.selected_map_icon,
    AppAsset.selected_favorite_icon,
    AppAsset.selected_profile_icon
  ];
  List<String> unselectedIconList = [
    AppAsset.unselected_home_icon,
    AppAsset.unselected_map_icon,
    AppAsset.unselected_favorite_icon,
    AppAsset.unselected_profile_icon
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: tabs[selectedIndex],
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(
            side: BorderSide(
              color: AppColor.whiteColor,
              width: 2,
            ),
          ),
          onPressed: () {
            // Handle the action for the floating action button
          },
          child: Icon(Icons.add, color: AppColor.whiteColor),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          // color: AppColor.redColor,
          notchMargin: 5,
          shape: CircularNotchedRectangle(),
          child: BottomNavigationBar(
              elevation: 0,
              currentIndex: selectedIndex,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              selectedItemColor: AppColor.whiteColor,
              unselectedItemColor: AppColor.whiteColor,
              selectedLabelStyle: AppStyle.bold12white,
              unselectedLabelStyle: AppStyle.bold12white,
              items: [
                BottomNavigationBarItem(
                    icon: Image.asset(
                      selectedIndex == 0
                          ? selectedIconList[0]
                          : unselectedIconList[0],
                    ),
                    label: AppLocalizations.of(context)!.home),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    selectedIndex == 1
                        ? selectedIconList[1]
                        : unselectedIconList[1],
                  ),
                  label: AppLocalizations.of(context)!.map,
                ),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      selectedIndex == 2
                          ? selectedIconList[2]
                          : unselectedIconList[2],
                    ),
                    label: AppLocalizations.of(context)!.favorites),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      selectedIndex == 3
                          ? selectedIconList[3]
                          : unselectedIconList[3],
                    ),
                    label: AppLocalizations.of(context)!.profile),
              ]),
        ));
  }
}
