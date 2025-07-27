import 'package:flutter/material.dart';
import 'package:eventapp/models/event.dart';

class EventDetailsScreen extends StatelessWidget {
  final Event event;
  const EventDetailsScreen({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // TODO: Navigate to EditEventScreen
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              // TODO: Implement delete logic
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                event.image,
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              event.title,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 18),
                const SizedBox(width: 8),
                Text(
                  '${event.dateTime.day} ${event.dateTime.month} ${event.dateTime.year}',
                ),
                const SizedBox(width: 16),
                Icon(Icons.access_time, size: 18),
                const SizedBox(width: 8),
                Text(event.time),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.location_on, size: 18),
                const SizedBox(width: 8),
                Text('Cairo, Egypt'), // TODO: Use event location if available
              ],
            ),
            const SizedBox(height: 16),
            Container(
              height: 150,
              width: double.infinity,
              color: Colors.grey[300],
              child: const Center(child: Text('Map Placeholder')), // TODO: Add map widget
            ),
            const SizedBox(height: 16),
            Text(
              'Description',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: 8),
            Text(event.description),
          ],
        ),
      ),
    );
  }
} 