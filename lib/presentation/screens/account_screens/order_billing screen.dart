import 'package:flutter/material.dart';

class OrdersBillingScreen extends StatelessWidget {
  const OrdersBillingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        title: const Text('Orders and Billing Info'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildOrderCard(
              context,
              orderId: 'ORD123',
              date: '2025-04-15',
              amount: 29.99,
              status: 'Completed',
              onView: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('View Order ORD123')),
                );
              },
            ),
            _buildOrderCard(
              context,
              orderId: 'ORD124',
              date: '2025-04-10',
              amount: 15.99,
              status: 'Pending',
              onView: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('View Order ORD124')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderCard(BuildContext context,
      {required String orderId,
        required String date,
        required double amount,
        required String status,
        required VoidCallback onView}) {
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
              'Order #$orderId',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Date: $date',
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            Text(
              'Amount: \$${amount.toStringAsFixed(2)}',
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            Text(
              'Status: $status',
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onView,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text('View Details', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}