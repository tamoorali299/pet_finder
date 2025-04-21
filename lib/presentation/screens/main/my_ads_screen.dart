import 'package:flutter/material.dart';
import '../../widgets/ad_card_widget.dart';
import '../../widgets/promo_banner_widget.dart';

class MyAdsScreen extends StatelessWidget {
  const MyAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF1A1A1A), // Dark background
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'My Ads',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          'FAVOURITES',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        TextButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('View all clicked')),
                            );
                          },
                          child: const Text(
                            'View all (1)',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Promo Banner
              PromoBannerWidget(
                text: 'Heavy discount packages',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('View packages clicked')),
                  );
                },
              ),
              // Ad List
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    AdCardWidget(
                      imageUrl: 'https://via.placeholder.com/100', // Placeholder image
                      title: 'Parrot',
                      price: 'Rs 5,000',
                      status: 'Active',
                      views: 0,
                      likes: 0,
                      startDate: DateTime(2023, 10, 21),
                      endDate: DateTime(2023, 11, 24),
                      onSellFaster: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Sell faster clicked')),
                        );
                      },
                    ),
                    // Add more AdCardWidgets here for additional ads
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}