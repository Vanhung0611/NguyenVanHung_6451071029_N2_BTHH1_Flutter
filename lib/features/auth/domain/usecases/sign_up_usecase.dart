import '../repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository repository;
  SignUpUseCase(this.repository);

  Future<void> call(String email, String password, String fullName) async {
    if (email.isEmpty || password.isEmpty || fullName.isEmpty) {
      throw 'Vui lòng điền đầy đủ thông tin';
    }
    if (password.length < 6) {
      throw 'Mật khẩu phải có ít nhất 6 ký tự';
    }
    await repository.signUp(email, password, fullName);
  }
}