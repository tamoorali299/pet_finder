import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_finder/domain/entities/user.dart';
import 'package:pet_finder/domain/repositories/auth_repository.dart';
import '../data_sources/auth_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;
  final firebase_auth.FirebaseAuth _auth = firebase_auth.FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<User> login(String email, String password) async {
    final firebaseUser = await _auth.signInWithEmailAndPassword(email: email, password: password);
    final user = firebaseUser.user;
    if (user == null) {
      throw Exception('Login failed: No user returned');
    }
    final doc = await _firestore.collection('users').doc(user.uid).get();
    if (!doc.exists) {
      throw Exception('User data not found');
    }
    final userModel = UserModel.fromFirestore(doc);
    return User(
      id: userModel.id ?? user.uid,
      email: userModel.email ?? user.email!,
      name: userModel.name,
      petCategory: userModel.petCategory,
    );
  }

  @override
  Future<User> signUp(String email, String password, {String? name, String? petCategory}) async {
    final firebaseUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    final user = firebaseUser.user;
    if (user == null) {
      throw Exception('Signup failed: No user returned');
    }
    await user.updateDisplayName(name);
    await _firestore.collection('users').doc(user.uid).set({
      'email': email,
      'name': name,
      'petCategory': petCategory,
      'createdAt': FieldValue.serverTimestamp(),
    });
    return User(
      id: user.uid,
      email: email,
      name: name,
      petCategory: petCategory,
    );
  }

  @override
  Future<void> forgetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
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
    return _firestore
        .collection('ads')
        .where('category', isEqualTo: petCategory)
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => AdModel.fromFirestore(doc)).toList());
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