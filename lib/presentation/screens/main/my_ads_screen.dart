import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/pet_card.dart';

class MyAdsScreen extends StatelessWidget {
  const MyAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;

    if (user == null) {
      return const Scaffold(
        backgroundColor: Color(0xFF1A1A1A),
        body: Center(
          child: Text('Please log in to view your ads', style: TextStyle(color: Colors.white)),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        title: Text('My Ads', style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
            color: Colors.white
        ),),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('ads')
            .where('ownerId', isEqualTo: user.id)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('Error fetching my ads: ${snapshot.error}');
            return const Center(
              child: Text('Error loading ads', style: TextStyle(color: Colors.white)),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final ads = snapshot.data!.docs.map((doc) => AdModel.fromFirestore(doc)).toList();

          if (ads.isEmpty) {
            return const Center(
              child: Text('You have no ads', style: TextStyle(color: Colors.white)),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: ads.length,
            itemBuilder: (context, index) {
              final ad = ads[index];
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
            },
          );
        },
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