import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventapp/Utilis/firebaseutilis.dart';
import 'package:eventapp/models/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventListProvider extends ChangeNotifier {
  List<Event> eventList = [];
  List<Event> filterEventList = [];
  List<Event> favoriteEventList = [];
  List<String> eventNameList = [];
  int selectedIndex = 0;
  List<String> geteventNameList(BuildContext context) {
    return eventNameList = [
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
  }

  void getAllEvent() async {
    QuerySnapshot<Event> querySnapshot =
        await FireBaseUtilis.getEventCollection().get();
    eventList = querySnapshot.docs.map(
      (doc) {
        return doc.data();
      },
    ).toList();
    filterEventList = eventList;
    filterEventList.sort(
      (a, b) {
        return a.dateTime.compareTo(b.dateTime)  ;
      },
    );
    notifyListeners();
    //  eventList= querySnapshot.docs.cast<Event>();
  }

  // void getFilteredEvent() async {
  //   var querySnapshot =
  //       await FireBaseUtilis.getEventCollection().orderBy('dateTime').get();
  //   eventList = querySnapshot.docs.map((doc) => doc.data()).toList();

  //   filterEventList = eventList.where(
  //     (event) {
  //       return event.eventName == eventNameList[selectedIndex];
  //     },
  //   ).toList();
  //   notifyListeners();
  // }

  void ChangeSelectedIndex(int newselectedIndex) {
    selectedIndex = newselectedIndex;
    selectedIndex == 0 ? getAllEvent() : getFilteredEventFromFireStore();
    // notifyListeners();
  }

  void getFilteredEventFromFireStore() async {
    var querySnapshot = await FireBaseUtilis.getEventCollection()
        .orderBy('dateTime', descending: false)
        .where('eventName', isEqualTo: eventNameList[selectedIndex])
        .get();
    filterEventList = querySnapshot.docs.map(
      (doc) {
        return doc.data();
      },
    ).toList();
    notifyListeners();
  }

  void updateIsFavorite(Event event) {
    FireBaseUtilis.getEventCollection()
        .doc(event.id)
        .update({'isFavorite': !event.isFavorite}).timeout(
      Duration(milliseconds: 500),
      onTimeout: () {},
    );
    selectedIndex == 0 ? getAllEvent() : getFilteredEventFromFireStore();
    getFavoriteEvent();
    notifyListeners();
  }

  void getFavoriteEvent() async {
    var querySnapshot = await FireBaseUtilis.getEventCollection()
        .orderBy('dateTime')
        .where('isFavorite', isEqualTo: true)
        .get();
    favoriteEventList = querySnapshot.docs.map(
      (doc) {
        return doc.data();
      },
    ).toList();
    notifyListeners();
  }

  void updateEvent(Event event) async {
    await FireBaseUtilis.getEventCollection()
        .doc(event.id)
        .update(event.toFireStore()).timeout(Duration(milliseconds: 500),onTimeout: () {},);
    selectedIndex == 0 ? getAllEvent() : getFilteredEventFromFireStore();
    // getFavoriteEvent();
    notifyListeners();
  }

  void deleteEvent(String eventId) async {
    await FireBaseUtilis.getEventCollection().doc(eventId).delete().timeout(Duration(milliseconds: 500),onTimeout: () {},);
    selectedIndex == 0 ? getAllEvent() : getFilteredEventFromFireStore();
    getFavoriteEvent();
    notifyListeners();
  }
}
