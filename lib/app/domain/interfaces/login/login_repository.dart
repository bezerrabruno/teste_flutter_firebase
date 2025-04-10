import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepository {
  Future<Either<Exception, User>> login(String login, String password);

  Future<void> logout();
}
