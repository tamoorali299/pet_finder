import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:pet_finder/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password);
  Future<User> signUp(String email, String password, {String? name, String? petCategory});
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
  final String? petCategory;
  final Timestamp? createdAt;

  UserModel({this.id, this.email, this.name, this.petCategory, this.createdAt});

  factory UserModel.fromFirebaseUser(firebase_auth.User user, {String? name, String? petCategory}) {
    return UserModel(
      id: user.uid,
      email: user.email,
      name: name ?? user.displayName,
      petCategory: petCategory,
    );
  }

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
      id: doc.id,
      email: data['email'],
      name: data['name'],
      petCategory: data['petCategory'],
      createdAt: data['createdAt'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'petCategory': petCategory,
      'createdAt': FieldValue.serverTimestamp(),
    };
  }
}

class AdModel {
  final String? id;
  final String? title;
  final String? category;
  final double? price;
  final String? ownerId;
  final dynamic createdAt;

  AdModel({this.id, this.title, this.category, this.price, this.ownerId, this.createdAt});

  factory AdModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return AdModel(
      id: doc.id,
      title: data['title'],
      category: data['category'],
      price: (data['price'] as num?)?.toDouble(),
      ownerId: data['ownerId'],
      createdAt: data['createdAt'],
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