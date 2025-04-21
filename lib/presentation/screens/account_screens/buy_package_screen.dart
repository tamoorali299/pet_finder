import 'package:flutter/material.dart';

class BuyPackagesScreen extends StatelessWidget {
  const BuyPackagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        title: const Text('Buy Discounted Packages'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildPackageCard(
              context,
              title: 'Basic Package',
              price: 9.99,
              description: '5 listings, 1 month validity',
              onBuy: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Basic Package purchased')),
                );
              },
            ),
            _buildPackageCard(
              context,
              title: 'Pro Package',
              price: 19.99,
              description: '20 listings, 3 months validity',
              onBuy: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Pro Package purchased')),
                );
              },
            ),
            _buildPackageCard(
              context,
              title: 'Premium Package',
              price: 49.99,
              description: 'Unlimited listings, 6 months validity',
              onBuy: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Premium Package purchased')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPackageCard(BuildContext context,
      {required String title,
        required double price,
        required String description,
        required VoidCallback onBuy}) {
    return Card(
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 8),
            Text(
              '\$${price.toStringAsFixed(2)}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onBuy,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text('Buy Now', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}