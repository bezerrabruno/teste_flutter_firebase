import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:teste_flutter_firebase/app/core/firebase/authentication.dart';

class LoginWithEmailUsecase {
  Future<Either<Exception, User>> call({
    required String login,
    required String password,
  }) async {
    final passwordEncode = md5.convert(utf8.encode(password)).toString();

    try {
      final result =
          await Authentication.login(email: login, password: passwordEncode);

      if (result != null) {
        return Right(result);
      } else {
        return Left(Exception('User Null'));
      }
    } catch (e) {
      return Left(Exception('LoginWithEmailUsecase | Error'));
    }
  }
}
