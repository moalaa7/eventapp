import 'package:eventapp/Utilis/app_color.dart';

import 'package:flutter/material.dart';

class EventTabItem extends StatelessWidget {
  final bool isSelected;
  final String eventName;
  final Color? borderColor;
  final Color selectedGgColor;
  TextStyle? selectedTextStyle;
   TextStyle? unSelectedTextStyle;


  EventTabItem({
    super.key,
    required this.eventName,
    required this.isSelected,
    this.borderColor,
    required this.selectedGgColor,
      required this.selectedTextStyle,
        required this.unSelectedTextStyle

  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
        margin: EdgeInsets.symmetric(
          horizontal: width * 0.02,
        ),
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.02, vertical: height * 0.007),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(46),
            color: isSelected ? selectedGgColor : AppColor.transparentColor,
            border: Border.all(
                color: borderColor ?? Theme.of(context).canvasColor, width: 2)),
        child: Text(
          eventName,
          style: isSelected
              ? selectedTextStyle
              : unSelectedTextStyle,
        ));
  }
}
