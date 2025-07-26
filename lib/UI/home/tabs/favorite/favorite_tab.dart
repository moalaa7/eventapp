import 'package:eventapp/UI/home/tabs/homeTab/event_items.dart';
import 'package:eventapp/providers/eventlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {

late EventListProvider eventListProvider;

  @override
  void initState(){
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) { 

      eventListProvider.getFavoriteEvent();
    });
  }
  @override
  Widget build(BuildContext context) {
       eventListProvider = Provider.of<EventListProvider>(context);
    return Scaffold(
      body:  Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) => EventItem(event:eventListProvider.favoriteEventList[index] ,), 
                  itemCount:eventListProvider.favoriteEventList.length))
        ],
      ),
    );
  }
}