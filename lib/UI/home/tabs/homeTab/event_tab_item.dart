import 'package:eventapp/Utilis/app_color.dart';

import 'package:flutter/material.dart';

class EventTabItem extends StatefulWidget {
 final bool isSelected;
  final eventName;

  EventTabItem({super.key, required this.eventName, required this.isSelected});

  @override
  State<EventTabItem> createState() => _EventTabItemState();
}

class _EventTabItemState extends State<EventTabItem> {
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
            color: widget.isSelected
                ? Theme.of(context).canvasColor
                : AppColor.transparentColor,
            border: Border.fromBorderSide(BorderSide(
                color: Theme.of(context).copyWith().canvasColor, width: 2))),
        child: Text(
          widget.eventName,
          style: widget.isSelected
              ? Theme.of(context).textTheme.bodySmall
              : Theme.of(context).textTheme.bodyMedium,
        ));
  }
}
