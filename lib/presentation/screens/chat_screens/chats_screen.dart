import 'package:flutter/material.dart';
import '../../widgets/chat_card_widget.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for chat list
    final List<Map<String, dynamic>> chats = [
      {
        'imageUrl': 'https://via.placeholder.com/50',
        'name': 'John Doe',
        'lastMessage': 'Interested in your Persian Cat!',
        'time': '10:30 AM',
        'unreadCount': 2,
      },
      {
        'imageUrl': 'https://via.placeholder.com/50',
        'name': 'Jane Smith',
        'lastMessage': 'Can you send more photos?',
        'time': 'Yesterday',
        'unreadCount': 0,
      },
      {
        'imageUrl': 'https://via.placeholder.com/50',
        'name': 'Ali Khan',
        'lastMessage': 'Price negotiation?',
        'time': '2 days ago',
        'unreadCount': 1,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Chats", style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          fontFamily: 'Inter'
        ),),
        backgroundColor: const Color(0xFF1A1A1A),
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xFF1A1A1A), // Dark background
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ChatCardWidget(
            imageUrl: chat['imageUrl'],
            name: chat['name'],
            lastMessage: chat['lastMessage'],
            time: chat['time'],
            unreadCount: chat['unreadCount'],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to new chat screen (placeholder)
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Start new chat')),
          );
        },
        backgroundColor: Theme.of(context).primaryColor, // Purple
        heroTag: 'chats_fab', // Unique tag for ChatsScreen FAB
        child: const Icon(Icons.message),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}