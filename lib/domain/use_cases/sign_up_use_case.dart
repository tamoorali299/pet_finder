import 'package:pet_finder/domain/entities/user.dart';
import 'package:pet_finder/domain/repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<User> execute(String email, String password, {String? name, String? petCategory}) async {
    return await repository.signUp(email, password, name: name, petCategory: petCategory);
  }
}