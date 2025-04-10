import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:teste_flutter_firebase/app/domain/interfaces/login/login_repository.dart';
import 'package:teste_flutter_firebase/app/infra/interfaces/login/external_login_datasource.dart';

class DataLoginRepository implements LoginRepository {
  final ExternalLoginDatasource _externalLoginDatasource;

  DataLoginRepository(this._externalLoginDatasource);

  @override
  Future<Either<Exception, User>> login(
    String login,
    String password,
  ) async {
    try {
      final result = await _externalLoginDatasource.login(login, password);

      return Right(result);
    } catch (e) {
      return Left(
        Exception('DataLoginRepository: login Exception'),
      );
    }
  }

  @override
  Future<void> logout() async {
    await _externalLoginDatasource.logout();
  }
}
