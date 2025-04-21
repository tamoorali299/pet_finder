import 'package:flutter/material.dart';

class DeliveryOrdersScreen extends StatelessWidget {
  const DeliveryOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        title: const Text('Delivery Orders'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildDeliveryCard(
              context,
              orderId: 'DEL123',
              status: 'In Transit',
              estimatedDelivery: '2025-04-20',
              onTrack: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Track Order DEL123')),
                );
              },
            ),
            _buildDeliveryCard(
              context,
              orderId: 'DEL124',
              status: 'Delivered',
              estimatedDelivery: '2025-04-12',
              onTrack: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Track Order DEL124')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeliveryCard(BuildContext context,
      {required String orderId,
        required String status,
        required String estimatedDelivery,
        required VoidCallback onTrack}) {
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
              'Delivery #$orderId',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Status: $status',
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            Text(
              'Estimated Delivery: $estimatedDelivery',
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onTrack,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text('Track Order', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}