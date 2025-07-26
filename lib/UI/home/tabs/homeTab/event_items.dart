import 'package:eventapp/Utilis/app_color.dart';
import 'package:eventapp/Utilis/app_style.dart';
import 'package:eventapp/models/event.dart';
import 'package:eventapp/providers/eventlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventItem extends StatelessWidget {
  Event event;
  EventItem({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var eventListProvider = Provider.of<EventListProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: height * 0.01),
      margin: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: height * 0.01),
      height: height * 0.3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: AssetImage(
                event.image,
              ),
              fit: BoxFit.fill)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.02, vertical: height * 0.005),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).scaffoldBackgroundColor),
            child: Column(
              children: [
                Text(
                  event.dateTime.day.toString(),
                  style: AppStyle.bold14primary,
                ),
                Text(
                  DateFormat('MMM').format(event.dateTime),
                  style: AppStyle.bold14primary,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.02, vertical: height * 0.005),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).scaffoldBackgroundColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    event.title,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      eventListProvider.updateIsFavorite(event);
                    },
                    icon: Icon(
                      event.isFavorite? Icons.favorite
                      :Icons.favorite_border_outlined,
                      color: AppColor.primaryLightColor,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
