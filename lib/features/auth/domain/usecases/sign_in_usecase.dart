import '../repositories/auth_repository.dart';

class SignInUseCase {
  final AuthRepository repository;
  SignInUseCase(this.repository);

  Future<void> call(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      throw 'Email và mật khẩu không được để trống';
    }
    await repository.signIn(email, password);
  }
}