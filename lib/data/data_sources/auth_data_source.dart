import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class AuthDataSource {
  Future<firebase_auth.User> login(String email, String password) async {
    try {
      final userCredential = await firebase_auth.FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user!;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<firebase_auth.User> signUp(String email, String password) async {
    try {
      final userCredential = await firebase_auth.FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user!;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> forgetPassword(String email) async {
    try {
      await firebase_auth.FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}