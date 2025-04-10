import 'package:firebase_auth/firebase_auth.dart';
import 'package:teste_flutter_firebase/app/core/firebase/authentication.dart';
import 'package:teste_flutter_firebase/app/infra/interfaces/login/external_login_datasource.dart';

class ApiLoginDatasource implements ExternalLoginDatasource {
  final Authentication _authentication;

  ApiLoginDatasource(this._authentication);

  @override
  Future<User> login(String login, String password) async {
    return await _authentication.login(
      email: login,
      password: password,
    );
  }

  @override
  Future<void> logout() async {
    await _authentication.logout();
  }
}
