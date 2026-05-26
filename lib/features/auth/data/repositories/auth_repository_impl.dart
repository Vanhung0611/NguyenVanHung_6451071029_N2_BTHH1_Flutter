import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _dataSource;
  AuthRepositoryImpl(this._dataSource);

  @override
  Future<void> signIn(String email, String password) async {
    try {
      await _dataSource.signIn(email, password);
    } on FirebaseAuthException catch (e) {
      throw _mapError(e.code);
    }
  }

  @override
  Future<void> signUp(String email, String password, String fullName) async {
    try {
      await _dataSource.signUp(email, password, fullName);
    } on FirebaseAuthException catch (e) {
      throw _mapError(e.code);
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    try {
      await _dataSource.signInWithGoogle();
    } on FirebaseAuthException catch (e) {
      throw _mapError(e.code);
    }
  }

  @override
  Future<void> signOut() async => await _dataSource.signOut();

  String _mapError(String code) {
    switch (code) {
      case 'email-already-in-use': return 'Email đã được sử dụng';
      case 'wrong-password':       return 'Sai mật khẩu';
      case 'user-not-found':       return 'Tài khoản không tồn tại';
      case 'invalid-email':        return 'Email không hợp lệ';
      case 'weak-password':        return 'Mật khẩu quá yếu';
      default:                     return 'Đã có lỗi xảy ra';
    }
  }
  @override
  Future<void> resetPassword(String email) async {
    try {
      await _dataSource.resetPassword(email);
    } on FirebaseAuthException catch (e) {
      throw _mapError(e.code);
    }
  }
}