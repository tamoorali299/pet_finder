import 'package:flutter/material.dart';
import '../../widgets/pet_card.dart';
import '../notification_screen/notification_screen.dart';
import '../category/category_detail_screen.dart';
import '../all_pets/all_pets_screen.dart';
import '../category/all_categories_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1A), // Dark background like in the screenshot
        title: const Text(
          'Pet Finder',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          // Notification Icon
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationScreen()),
              );
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: Column(
            children: [
              // Location Dropdown
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.blue),
                    const SizedBox(width: 8),
                    DropdownButton<String>(
                      value: 'Lahore, Punjab',
                      dropdownColor: Colors.black,
                      style: const TextStyle(color: Colors.white),
                      items: <String>['Lahore, Punjab', 'Karachi, Sindh', 'Islamabad']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (_) {},
                    ),
                  ],
                ),
              ),
              // Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'What are you looking for?',
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.search, color: Colors.white),
                    filled: true,
                    fillColor: const Color(0xFF2A2A2A), // Slightly lighter than AppBar
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Banner (Placeholder)
            Container(
              height: 150,
              width: 450,
              color: Colors.purple[300],
              child: Image.asset('assets/images/ads.jpg',fit: BoxFit.fill,)
            ),
            // Categories Section (Placeholder)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Browse Categories',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AllCategoriesScreen()),
                      );
                    },
                    child: const Text('See all', style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ),
            // Categories Row (Placeholder)
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _CategoryIcon(icon: Icons.pets, label: 'Cats'),
                  _CategoryIcon(icon: Icons.pets, label: 'Dogs'),
                  _CategoryIcon(icon: Icons.pets, label: 'Birds'),
                  _CategoryIcon(icon: Icons.pets, label: 'Fish'),
                  _CategoryIcon(icon: Icons.pets, label: 'Hen'),
                  _CategoryIcon(icon: Icons.pets, label: 'Horse'),
                  _CategoryIcon(icon: Icons.pets, label: 'Goat'),
                  _CategoryIcon(icon: Icons.pets, label: 'Cow'),
                  _CategoryIcon(icon: Icons.pets, label: 'Bull'),
                  _CategoryIcon(icon: Icons.pets, label: 'Camel'),
                ],
              ),
            ),
            // Pet Listings Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Pet Listings',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AllPetsScreen()),
                      );
                    },
                    child: const Text('See all', style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ),
            // Pet Cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: const [
                  PetCard(
                    imageUrl: 'https://via.placeholder.com/150', // Placeholder image
                    title: 'Persian Cat',
                    price: 'Rs 25,000',
                    location: 'DHA Phase 5, Lahore',
                    timeAgo: '7 hours ago',
                  ),
                  PetCard(
                    imageUrl: 'https://via.placeholder.com/150', // Placeholder image
                    title: 'German Shepherd',
                    price: 'Rs 50,000',
                    location: 'Gulberg, Lahore',
                    timeAgo: '2 days ago',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Category Icon Widget for Categories Row
class _CategoryIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const _CategoryIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryDetailScreen(category: label),
            ),
          );
        },
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey[300],
              child: Icon(icon, size: 30, color: Colors.black),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}