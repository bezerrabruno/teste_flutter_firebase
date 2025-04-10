import 'package:firebase_auth/firebase_auth.dart';

abstract class ExternalLoginDatasource {
  Future<User> login(String login, String password);

  Future<void> logout();
}
