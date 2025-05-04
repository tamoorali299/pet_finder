import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_finder/domain/entities/user.dart';
import 'package:pet_finder/domain/repositories/auth_repository.dart';
import '../data_sources/auth_data_source.dart';
import 'package:rxdart/rxdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;
  final firebase_auth.FirebaseAuth _auth = firebase_auth.FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<User> login(String email, String password) async {
    final firebaseUser = await dataSource.login(email, password);
    final doc = await _firestore.collection('users').doc(firebaseUser.uid).get();
    if (!doc.exists) {
      throw Exception('User data not found');
    }
    final userModel = UserModel.fromFirestore(doc);
    return User(
      id: userModel.id ?? firebaseUser.uid,
      email: userModel.email ?? firebaseUser.email!,
      name: userModel.name,
    );
  }

  @override
  Future<User> signUp(String email, String password, {String? name}) async {
    final firebaseUser = await dataSource.signUp(email, password);
    await firebaseUser.updateDisplayName(name);
    await _firestore.collection('users').doc(firebaseUser.uid).set({
      'email': email,
      'name': name,
      'createdAt': FieldValue.serverTimestamp(),
    });
    return User(
      id: firebaseUser.uid,
      email: email,
      name: name,
    );
  }

  @override
  Future<void> forgetPassword(String email) async {
    await dataSource.forgetPassword(email);
  }

  @override
  Future<String?> getToken() async {
    final user = _auth.currentUser;
    if (user != null) {
      return await user.getIdToken();
    }
    return null;
  }

  @override
  Future<void> logout() async {
    await _auth.signOut();
  }

  @override
  Stream<List<AdModel>> getAds(String petCategory) {
    print('Fetching all ads');
    return FirebaseFirestore.instance
        .collection('ads')
        .snapshots()
        .map((snapshot) {
      print('Fetched ${snapshot.docs.length} ads');
      return snapshot.docs.map((doc) => AdModel.fromFirestore(doc)).toList();
    }).handleError((error) {
      print('Error fetching ads: $error');
      throw error;
    }).startWith([]); // Emit an empty list immediately
  }

  @override
  Future<void> createAd({
    required String title,
    required String category,
    required double price,
    required String ownerId,
  }) async {
    try {
      await _firestore.collection('ads').add({
        'title': title,
        'category': category,
        'price': price,
        'ownerId': ownerId,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to create ad: $e');
    }
  }
}