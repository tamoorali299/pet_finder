import 'package:flutter/material.dart';
import 'package:pet_finder/domain/repositories/auth_repository.dart' show AdModel;
import 'package:pet_finder/presentation/providers/auth_provider.dart';
import 'package:pet_finder/presentation/screens/category/all_categories_screen.dart';
import 'package:pet_finder/presentation/screens/category/category_detail_screen.dart';
import 'package:pet_finder/presentation/screens/main/main_screen.dart';
import 'package:pet_finder/presentation/screens/notification_screen/notification_screen.dart';
import 'package:provider/provider.dart';
import '../../widgets/pet_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;

    if (user == null) {
      return const Center(child: Text('Please log in', style: TextStyle(color: Colors.white)));
    }

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1A),
        title: const Text(
          'Pet Finder',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'What are you looking for?',
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.search, color: Colors.white),
                    filled: true,
                    fillColor: const Color(0xFF2A2A2A),
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
            Container(
              height: 150,
              width: 450,
              color: Colors.purple[300],
              child: Image.asset(
                'assets/images/ads.jpg',
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Text(
                      'Ad Banner',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  );
                },
              ),
            ),
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
                        MaterialPageRoute(builder: (context) => const MainScreen()),
                      );
                    },
                    child: const Text('See all', style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ),
            StreamBuilder<List<AdModel>>(
              stream: authProvider.getAds(""),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print('StreamBuilder error: ${snapshot.error}');
                  return const Center(child: Text('Error loading ads', style: TextStyle(color: Colors.white)));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No ads found', style: TextStyle(color: Colors.white)));
                }

                final ads = snapshot.data!;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: ads.map((ad) {
                      final timeAgo = ad.createdAt != null
                          ? _timeAgo(ad.createdAt!.toDate())
                          : 'Unknown time';
                      return PetCard(
                        imageUrl: 'https://via.placeholder.com/150',
                        title: ad.title ?? 'Untitled',
                        price: 'Rs ${ad.price?.toStringAsFixed(0) ?? '0'}',
                        location: 'Unknown Location',
                        timeAgo: timeAgo,
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  String _timeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }
}

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