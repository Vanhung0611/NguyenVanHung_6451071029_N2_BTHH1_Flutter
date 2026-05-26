import '../repositories/auth_repository.dart';

class ResetPasswordUseCase {
  final AuthRepository repository;
  ResetPasswordUseCase(this.repository);

  Future<void> call(String email) async {
    if (email.isEmpty) throw 'Vui lòng nhập email';
    if (!email.contains('@')) throw 'Email không hợp lệ';
    await repository.resetPassword(email);
  }
}