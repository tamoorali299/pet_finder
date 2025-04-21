import 'package:flutter/material.dart';
import '../../widgets/pet_card.dart';

class AllPetsScreen extends StatelessWidget {
  const AllPetsScreen({super.key});

  // Dummy data for all pet ads
  List<Map<String, String>> getAllPets() {
    return [
      {
        'imageUrl': 'https://via.placeholder.com/150',
        'title': 'Persian Cat',
        'price': 'Rs 25,000',
        'location': 'DHA Phase 5, Lahore',
        'timeAgo': '7 hours ago',
      },
      {
        'imageUrl': 'https://via.placeholder.com/150',
        'title': 'German Shepherd',
        'price': 'Rs 50,000',
        'location': 'Gulberg, Lahore',
        'timeAgo': '2 days ago',
      },
      {
        'imageUrl': 'https://via.placeholder.com/150',
        'title': 'Parrot',
        'price': 'Rs 5,000',
        'location': 'Model Town, Lahore',
        'timeAgo': '1 day ago',
      },
      {
        'imageUrl': 'https://via.placeholder.com/150',
        'title': 'Goldfish',
        'price': 'Rs 1,000',
        'location': 'Faisal Town, Lahore',
        'timeAgo': '3 days ago',
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final petAds = getAllPets();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1A),
        title: const Text(
          'All Pets',
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
        itemCount: petAds.length,
        itemBuilder: (context, index) {
          final pet = petAds[index];
          return PetCard(
            imageUrl: pet['imageUrl']!,
            title: pet['title']!,
            price: pet['price']!,
            location: pet['location']!,
            timeAgo: pet['timeAgo']!,
          );
        },
      ),
    );
  }
}