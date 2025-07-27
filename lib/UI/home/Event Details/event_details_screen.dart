import 'package:eventapp/UI/home/Add%20Event/add_event.dart';
import 'package:flutter/material.dart';
import 'package:eventapp/models/event.dart';
import 'package:eventapp/Utilis/app_color.dart';
import 'package:eventapp/Utilis/app_style.dart';
import 'package:eventapp/providers/eventlist_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventDetailsScreen extends StatelessWidget {
  final Event event;
  int selectedIndex;

  EventDetailsScreen({Key? key, required this.event, this.selectedIndex=0}) ;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var eventProvider = Provider.of<EventListProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColor.primaryLightColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppLocalizations.of(context)!.event_details,
          style: AppStyle.bold20primary,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: AppColor.primaryLightColor),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddEvent(event: event ),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              _showDeleteDialog(context, eventProvider);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(event.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Event Title
              Text(
                event.title,
                style: AppStyle.bold20white.copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),

              SizedBox(height: height * 0.01),

              // Date and Time

              Container(
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.01, horizontal: width * 0.02),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.primaryLightColor),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_month_outlined,
                        color: AppColor.primaryLightColor),
                    SizedBox(width: width * 0.03),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat('dd MMMM yyyy').format(event.dateTime),
                          style: AppStyle.bold16primary,
                        ),
                        Text(
                          event.time,
                          style: AppStyle.bold16black,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),

              // Location (placeholder - you can add location field to Event model)
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.01, horizontal: width * 0.02),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.primaryLightColor),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Icon(Icons.my_location_sharp,
                        color: AppColor.primaryLightColor),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Cairo, Egypt', // Placeholder - add location to Event model
                        style: AppStyle.bold16primary,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: AppColor.primaryLightColor,
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),

              // Map Placeholder
              Container(
                height: height * 0.3,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.map, size: 50, color: Colors.grey[600]),
                      SizedBox(height: 10),
                      Text(
                        'Map View',
                        style: AppStyle.bold16gray,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),

              // Description
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.description,
                      style: AppStyle.bold18black,
                    ),
                    SizedBox(height: height * 0.01),
                    Text(event.description, style: AppStyle.bold14black),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, EventListProvider provider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.delete_event),
          content: Text(
            AppLocalizations.of(context)!.confirm_delete,
            style: AppStyle.bold14black,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(AppLocalizations.of(context)!.cancel,
            style: AppStyle.bold16primary,),
            ),
            TextButton(
              onPressed: () {
                provider.deleteEvent(event.id);
                Navigator.of(context).pop();
                Navigator.of(context).pop(); // Go back to previous screen
              },
              child: Text(AppLocalizations.of(context)!.delete_event,
                  style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
} 

/*

  onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EventDetailsScreen(event: event),
          ),
        );
      },*/