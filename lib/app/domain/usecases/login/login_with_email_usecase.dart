import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:teste_flutter_firebase/app/domain/interfaces/login/login_repository.dart';

class LoginWithEmailUsecase {
  final LoginRepository _loginRepository;

  const LoginWithEmailUsecase(
    this._loginRepository,
  );

  Future<Either<Exception, User>> call({
    required String login,
    required String password,
  }) async {
    final passwordEncode = md5.convert(utf8.encode(password)).toString();

    return await _loginRepository.login(login, passwordEncode);
  }
}
