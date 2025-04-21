import '../../domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password);
  Future<User> signUp(String email, String password, {String? name, String? petCategory});
  Future<void> forgetPassword(String email);
  Future<String?> getToken();
  Future<void> logout();
}