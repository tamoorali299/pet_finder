import 'package:pet_finder/domain/repositories/auth_repository.dart';

class ForgetPasswordUseCase {
  final AuthRepository repository;

  ForgetPasswordUseCase(this.repository);

  Future<void> execute(String email) async {
    await repository.forgetPassword(email);
  }
}