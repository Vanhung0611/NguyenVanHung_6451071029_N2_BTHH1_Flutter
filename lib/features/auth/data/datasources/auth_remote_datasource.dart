import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<User> signUp(String email, String password, String fullName) async {
    final result = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await _db.collection('Account').doc(result.user!.uid).set({
      'UID': result.user!.uid,
      'Email': email,
      'FullName': fullName,
      'UserName': '',
      'Avatar': '',
    });
    return result.user!;
  }

  Future<User> signIn(String email, String password) async {
    final result = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result.user!;
  }

  Future<User> signInWithGoogle() async {
    // Flutter Web dùng GoogleAuthProvider trực tiếp
    final provider = GoogleAuthProvider();
    final result = await _auth.signInWithPopup(provider);

    final doc = await _db.collection('Account').doc(result.user!.uid).get();
    if (!doc.exists) {
      await _db.collection('Account').doc(result.user!.uid).set({
        'UID': result.user!.uid,
        'Email': result.user!.email ?? '',
        'FullName': result.user!.displayName ?? '',
        'UserName': '',
        'Avatar': result.user!.photoURL ?? '',
      });
    }
    return result.user!;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
}