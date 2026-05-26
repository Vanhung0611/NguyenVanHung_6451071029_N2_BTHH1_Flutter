abstract class AuthRepository {
  Future<void> signIn(String email, String password);
  Future<void> signUp(String email, String password, String fullName);
  Future<void> signInWithGoogle();
  Future<void> resetPassword(String email);
  Future<void> signOut();
}