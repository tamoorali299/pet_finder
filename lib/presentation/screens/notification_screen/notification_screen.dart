import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy notification data
    final List<Map<String, dynamic>> notifications = [
      {
        'title': 'New Message',
        'message': 'John Doe is interested in your Persian Cat!',
        'time': '10:30 AM',
        'isUnread': true,
      },
      {
        'title': 'Pet Sold',
        'message': 'Your German Shepherd listing has been sold.',
        'time': 'Yesterday',
        'isUnread': false,
      },
      {
        'title': 'Price Update',
        'message': 'Someone offered Rs 20,000 for your Persian Cat.',
        'time': '2 days ago',
        'isUnread': true,
      },
      {
        'title': 'New Listing',
        'message': 'Check out a new Labrador listing near you!',
        'time': '3 days ago',
        'isUnread': false,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1A),
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: const Color(0xFF1A1A1A),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            color: const Color(0xFF2A2A2A),
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: notification['isUnread'] ? Colors.blue : Colors.grey,
                child: const Icon(Icons.notifications, color: Colors.white),
              ),
              title: Text(
                notification['title'],
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                notification['message'],
                style: const TextStyle(color: Colors.white70),
              ),
              trailing: Text(
                notification['time'],
                style: const TextStyle(color: Colors.white70),
              ),
            ),
          );
        },
      ),
    );
  }
}