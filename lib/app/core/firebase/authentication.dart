import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  static Future<User?> getUser() async {
    return await FirebaseAuth.instance.currentUser;
  }

  static Future<User?> login({
    required String email,
    required String password,
  }) async {
    final result = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    return result.user;
  }

  static Future<bool> logout() async {
    try {
      await FirebaseAuth.instance.signOut();

      return true;
    } catch (e) {
      return false;
    }
  }
}
