import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventapp/models/event.dart';

class FireBaseUtilis {
  static CollectionReference<Event> getEventCollection() {
    return FirebaseFirestore.instance
        .collection(Event.collectionName)
        .withConverter<Event>(
          fromFirestore: (snapshot, options) =>
              Event.fromFireStore(snapshot.data()!),
          toFirestore: (event, options) => event.toFireStore(),
        );
  }

  static Future<void> addEventToFireStore(Event event) {
    var eventCollection = getEventCollection();
    DocumentReference<Event> docRef = eventCollection.doc();
    event.id = docRef.id;
   return docRef.set(event);
  }
}
