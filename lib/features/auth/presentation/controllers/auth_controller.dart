import 'package:flutter/material.dart';
import '../../data/datasources/auth_remote_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/usecases/sign_in_usecase.dart';
import '../../domain/usecases/sign_up_usecase.dart';
import '../../domain/usecases/reset_password_usecase.dart';

class AuthController extends ChangeNotifier {
  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  final AuthRepositoryImpl _repository;

  bool isLoading = false;
  String? errorMessage;

  AuthController()
      : _repository = AuthRepositoryImpl(AuthRemoteDataSource()),
        _signInUseCase = SignInUseCase(AuthRepositoryImpl(AuthRemoteDataSource())),
        _signUpUseCase = SignUpUseCase(AuthRepositoryImpl(AuthRemoteDataSource())),
        _resetPasswordUseCase = ResetPasswordUseCase(AuthRepositoryImpl(AuthRemoteDataSource()));

  Future<bool> signIn(String email, String password) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try {
      await _signInUseCase(email, password);
      isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      isLoading = false;
      errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> signUp(String email, String password, String fullName) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try {
      await _signUpUseCase(email, password, fullName);
      isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      isLoading = false;
      errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> signInWithGoogle() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try {
      await _repository.signInWithGoogle();
      isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      isLoading = false;
      errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> resetPassword(String email) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try {
      await _resetPasswordUseCase(email);
      isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      isLoading = false;
      errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }
}