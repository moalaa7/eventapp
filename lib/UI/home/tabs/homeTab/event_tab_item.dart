import 'package:flutter/material.dart';

class EventTabItem extends StatelessWidget {
  String iconName;
   String eventName;

 EventTabItem({super.key, required this.iconName,required this.eventName});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(46)),
      child: Row(
        children: [Image.asset(iconName),
        Text(eventName)
        
        ],
      ),
    );
  }
}
