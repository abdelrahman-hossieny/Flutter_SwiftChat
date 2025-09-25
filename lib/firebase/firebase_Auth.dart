import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  // Add your Firebase authentication methods here
  final fireAuth = FirebaseAuth.instance;

  Future<UserCredential> signUpWithEmailAndPassword(String email, String password) async {
    return await fireAuth.createUserWithEmailAndPassword(email: email, password: password);
  }
}