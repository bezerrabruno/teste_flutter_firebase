import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  Future<User?> getUser() async {
    return await FirebaseAuth.instance.currentUser;
  }

  Future<User> login({
    required String email,
    required String password,
  }) async {
    final result = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    if (result.user == null) {
      throw Exception(
        'Auth: login Exception',
      );
    }

    return result.user!;
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
