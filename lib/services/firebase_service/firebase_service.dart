import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  static final _auth = FirebaseAuth.instance;

  static Future<UserCredential> signUp(String email, String password) {
    return _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  static Future<UserCredential> signIn(String email, String password) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }
}
