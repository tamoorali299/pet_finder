import 'package:flutter/material.dart';
import '../../widgets/pet_card.dart';

class CategoryDetailScreen extends StatelessWidget {
  final String category;

  const CategoryDetailScreen({super.key, required this.category});

  // Dummy data for pet ads (to be filtered by category)
  List<Map<String, String>> getPetAds() {
    final allPets = [
      {
        'imageUrl': 'https://via.placeholder.com/150',
        'title': 'Persian Cat',
        'price': 'Rs 25,000',
        'location': 'DHA Phase 5, Lahore',
        'timeAgo': '7 hours ago',
        'category': 'Cats',
      },
      {
        'imageUrl': 'https://via.placeholder.com/150',
        'title': 'German Shepherd',
        'price': 'Rs 50,000',
        'location': 'Gulberg, Lahore',
        'timeAgo': '2 days ago',
        'category': 'Dogs',
      },
      {
        'imageUrl': 'https://via.placeholder.com/150',
        'title': 'Parrot',
        'price': 'Rs 5,000',
        'location': 'Model Town, Lahore',
        'timeAgo': '1 day ago',
        'category': 'Birds',
      },
      {
        'imageUrl': 'https://via.placeholder.com/150',
        'title': 'Goldfish',
        'price': 'Rs 1,000',
        'location': 'Faisal Town, Lahore',
        'timeAgo': '3 days ago',
        'category': 'Fish',
      },
    ];
    return allPets.where((pet) => pet['category'] == category).toList();
  }

  @override
  Widget build(BuildContext context) {
    final petAds = getPetAds();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1A),
        title: Text(
          '$category Ads',
          style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: const Color(0xFF1A1A1A),
      body: petAds.isEmpty
          ? const Center(
        child: Text(
          'No ads available for this category.',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      )
          : ListView.builder(
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