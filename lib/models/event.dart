class Event {
  static const String collectionName = 'Events';
  String id;
  String image;
  String title;
  String description;
  String eventName;
  DateTime dateTime;
  String time;
  bool isFavorite;
  Event(
      {this.id = '',
      required this.title,
      required this.image,
      required this.dateTime,
      required this.description,
      required this.eventName,
      this.isFavorite = false,
      required this.time});

  Event.fromFireStore(Map<String, dynamic> data)
      : this(
          id: data['id'],
          title: data['title'],
          description: data['description'],
          image: data['image'],
          eventName: data['eventName'],
          dateTime: DateTime.fromMillisecondsSinceEpoch(data['dateTime']),
          time: data['time'],
          isFavorite: data['isFavorite'],
        );

  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'eventName': eventName,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'time': time,
      'isFavorite': isFavorite
    };
  }
}
