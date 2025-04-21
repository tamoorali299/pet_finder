import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/user_model.dart';

class AuthDataSource {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<UserModel> login(String email, String password) async {
    // Mock login API call
    await Future.delayed(const Duration(seconds: 1));
    if (email == "test@example.com" && password == "password") {
      final user = UserModel(
        id: "1",
        email: email,
        token: "mock_token",
        name: null, // Default to null if not provided
        petCategory: null, // Default to null if not provided
      );
      await storage.write(key: 'token', value: user.token);
      return user;
    } else {
      throw Exception("Invalid credentials");
    }
  }

  Future<UserModel> signUp(String email, String password, {String? name, String? petCategory}) async {
    // Mock signup API call
    await Future.delayed(const Duration(seconds: 1));
    final user = UserModel(
      id: "2",
      email: email,
      token: "mock_token",
      name: name, // Store provided name
      petCategory: petCategory, // Store provided petCategory
    );
    await storage.write(key: 'token', value: user.token);
    return user;
  }

  Future<void> forgetPassword(String email) async {
    // Mock forget password API call
    await Future.delayed(const Duration(seconds: 1));
    if (email != "test@example.com") {
      throw Exception("Email not found");
    }
  }

  Future<String?> getToken() async {
    return await storage.read(key: 'token');
  }

  Future<void> logout() async {
    await storage.delete(key: 'token');
  }
}