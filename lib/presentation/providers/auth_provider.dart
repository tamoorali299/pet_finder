import 'package:flutter/material.dart';
import 'package:pet_finder/data/data_sources/auth_data_source.dart';
import 'package:pet_finder/domain/entities/user.dart';
import 'package:pet_finder/domain/repositories/auth_repository.dart';
import 'package:pet_finder/domain/use_cases/forget_password_use_case.dart';
import 'package:pet_finder/domain/use_cases/login_use_case.dart';
import 'package:pet_finder/domain/use_cases/sign_up_use_case.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/repositories/auth_repository_impl.dart' as auth_impl;

class AuthProvider with ChangeNotifier {
  final AuthRepository repository;
  User? _user;
  String? _errorMessage;
  bool _isLoading = false;
  List<AdModel> _ads = [];

  AuthProvider() : repository = auth_impl.AuthRepositoryImpl(AuthDataSource());

  User? get user => _user;
  String? get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;
  List<AdModel> get ads => _ads;

  void setErrorMessage(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  Future<bool> checkAuthStatus() async {
    try {
      final token = await repository.getToken();
      if (token != null) {
        final userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(token)
            .get();

        if (userDoc.exists) {
          final userModel = UserModel.fromFirestore(userDoc);
          _user = User(
            id: userModel.id!,
            email: userModel.email!,
            name: userModel.name,
          );
        } else {
          _user = User(id: token, email: "unknown@example.com");
        }
        notifyListeners();
        return true;
      }
      _user = null;
      notifyListeners();
      return false;
    } catch (e) {
      print('Check auth status error: $e');
      _user = null;
      notifyListeners();
      return false;
    }
  }

  Future<void> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final loginUseCase = LoginUseCase(repository);
      _user = await loginUseCase.execute(email, password);

      if (_user != null) {
        final userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(_user!.id)
            .get();

        if (!userDoc.exists) {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(_user!.id)
              .set({
            'email': email,
            'createdAt': FieldValue.serverTimestamp(),
          });
          _user = User(
            id: _user!.id,
            email: email,
          );
        } else {
          final userModel = UserModel.fromFirestore(userDoc);
          _user = User(
            id: _user!.id,
            email: userModel.email ?? email,
            name: userModel.name,
          );
        }
        print('User logged in: ${_user!.id}');
      }
      notifyListeners();
    } catch (e) {
      print('Login error: $e');
      _errorMessage = _parseError(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signUp(String email, String password, {String? name}) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final signUpUseCase = SignUpUseCase(repository);
      _user = await signUpUseCase.execute(email, password, name: name);
      notifyListeners();
    } catch (e) {
      print('Sign-up error: $e');
      _errorMessage = _parseError(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> forgetPassword(String email) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final forgetPasswordUseCase = ForgetPasswordUseCase(repository);
      await forgetPasswordUseCase.execute(email);
    } catch (e) {
      print('Forget password error: $e');
      _errorMessage = _parseError(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    try {
      await repository.logout();
    } catch (e) {
      print('Logout error: $e');
    }
    _user = null;
    _ads = [];
    notifyListeners();
  }

  Stream<List<AdModel>> getAds(String petCategory) {
    return repository.getAds("").asBroadcastStream().map((ads) {
      _ads = ads;
      return ads;
    });
  }

  Future<void> createAd({
    required String title,
    required String category,
    required double price,
    required String ownerId,
  }) async {
    try {
      await repository.createAd(
        title: title,
        category: category,
        price: price,
        ownerId: ownerId,
      );
    } catch (e) {
      print('Create ad error: $e');
      _errorMessage = _parseError(e.toString()).replaceAll('Exception: ', '');
      notifyListeners();
    }
  }

  String _parseError(String error) {
    if (error.contains('CONFIGURATION_NOT_FOUND') ||
        error.contains('DEVELOPER_ERROR')) {
      return 'Firebase configuration issue. Please try again on a physical device or contact support.';
    } else if (error.contains('EMAIL_EXISTS')) {
      return 'This email is already registered. Please use a different email.';
    } else if (error.contains('WEAK_PASSWORD')) {
      return 'The password is too weak. Please use a stronger password.';
    } else if (error.contains('INVALID_EMAIL')) {
      return 'The email address is not valid. Please enter a valid email.';
    } else if (error.contains('NETWORK_REQUEST_FAILED')) {
      return 'Network error. Please check your internet connection and try again.';
    } else {
      return 'An error occurred: $error';
    }
  }
}