import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  static final auth = FirebaseAuth.instance;

  static Future<UserCredential> signUp(String email, String password) {
    return auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  static Future<UserCredential> signIn(String email, String password) {
    return auth.signInWithEmailAndPassword(email: email, password: password);
  }

  static Future<void> signOut() async {
    auth.signOut();
  }

  static Stream<User?> checkIfUserIsLoggedIn() {
    return auth.authStateChanges();
  }
}
