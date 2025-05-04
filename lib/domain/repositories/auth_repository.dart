import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_finder/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password);
  Future<User> signUp(String email, String password, {String? name});
  Future<void> forgetPassword(String email);
  Future<String?> getToken();
  Future<void> logout();
  Stream<List<AdModel>> getAds(String petCategory);
  Future<void> createAd({
    required String title,
    required String category,
    required double price,
    required String ownerId,
  });
}

class UserModel {
  final String? id;
  final String? email;
  final String? name;

  UserModel({
    this.id,
    this.email,
    this.name,
  });

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
      id: doc.id,
      email: data['email'] as String?,
      name: data['name'] as String?,
    );
  }
}

class AdModel {
  final String? id;
  final String? title;
  final String? category;
  final double? price;
  final String? ownerId;
  final Timestamp? createdAt;

  AdModel({
    this.id,
    this.title,
    this.category,
    this.price,
    this.ownerId,
    this.createdAt,
  });

  factory AdModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    print('Raw Firestore data for doc ${doc.id}: $data'); // Debug log

    // Safely parse the price field
    double? price;
    final rawPrice = data['price'];
    if (rawPrice is num) {
      price = rawPrice.toDouble();
    } else if (rawPrice is String) {
      price = double.tryParse(rawPrice);
    }

    // Safely parse the createdAt field
    Timestamp? createdAt;
    final rawCreatedAt = data['createdAt'];
    if (rawCreatedAt is Timestamp) {
      createdAt = rawCreatedAt;
    } else if (rawCreatedAt is String) {
      try {
        final dateTime = DateTime.parse(rawCreatedAt);
        createdAt = Timestamp.fromDate(dateTime);
      } catch (e) {
        print('Error parsing createdAt string: $e');
        createdAt = null; // Or set a default value
      }
    }

    return AdModel(
      id: doc.id,
      title: data['title'] as String?,
      category: data['category'] as String?,
      price: price,
      ownerId: data['ownerId'] as String?,
      createdAt: createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'category': category,
      'price': price,
      'ownerId': ownerId,
      'createdAt': FieldValue.serverTimestamp(),
    };
  }
}