import 'package:flutter/material.dart';
import '../../widgets/message_bubble_widget.dart';

class ChatDetailsScreen extends StatefulWidget {
  final String name;
  final String imageUrl;

  const ChatDetailsScreen({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  @override
  _ChatDetailsScreenState createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {'text': 'Hi, is your Persian Cat still available?', 'isSentByMe': false, 'time': '10:00 AM'},
    {'text': 'Yes, it is! Interested?', 'isSentByMe': true, 'time': '10:02 AM'},
    {'text': 'Yes, can you send more photos?', 'isSentByMe': false, 'time': '10:05 AM'},
  ];

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.add({
          'text': _messageController.text,
          'isSentByMe': true,
          'time': DateTime.now().toString().split(' ')[1].substring(0, 5),
        });
        _messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(widget.imageUrl),
              onBackgroundImageError: (_, __) => const Icon(Icons.person, color: Colors.white),
              backgroundColor: Colors.grey[800],
            ),
            const SizedBox(width: 8),
            Text(widget.name, style: const TextStyle(color: Colors.white)),
          ],
        ),
        backgroundColor: const Color(0xFF1A1A1A),
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xFF1A1A1A),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return MessageBubbleWidget(
                  message: message['text'],
                  isSentByMe: message['isSentByMe'],
                  time: message['time'],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(color: Colors.purple),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.white),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}