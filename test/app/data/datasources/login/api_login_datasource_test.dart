import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_flutter_firebase/app/core/firebase/authentication.dart';
import 'package:teste_flutter_firebase/app/data/datasources/login/api_login_datasource.dart';

class MockAuthentication extends Mock implements Authentication {}

class MockUser extends Mock implements User {}

void main() {
  group('ApiLoginDatasource', () {
    late MockAuthentication mockAuthentication;
    late ApiLoginDatasource apiLoginDatasource;

    setUp(() {
      mockAuthentication = MockAuthentication();
      apiLoginDatasource = ApiLoginDatasource(mockAuthentication);
    });

    test('Deve retornar sucesso ao fazer login com Firebase', () async {
      when(() => mockAuthentication.login(email: 'login', password: 'password'))
          .thenAnswer((_) async => MockUser());

      final result = await apiLoginDatasource.login('login', 'password');

      expect(result, isA<User>());
    });

    test('Deve retornar sucesso ao fazer logout com Firebase', () async {
      try {
        await apiLoginDatasource.logout();
      } catch (e) {}
    });
  });

  group('DioApiRequestAdapter | Exception', () {
    late MockAuthentication mockAuthentication;
    late ApiLoginDatasource apiLoginDatasource;

    setUp(() {
      mockAuthentication = MockAuthentication();
      apiLoginDatasource = ApiLoginDatasource(mockAuthentication);
    });

    test('Deve retornar erros no login com Firebase', () async {
      final response = Exception('Error');

      when(() => mockAuthentication.login(email: 'login', password: 'password'))
          .thenThrow(response);

      expect(() async => await apiLoginDatasource.login('login', 'password'),
          throwsA(isA<Exception>()));
    });

    test('Deve retornar sucesso ao fazer logout com Firebase', () async {
      final response = Exception('Error');

      when(() => mockAuthentication.logout()).thenThrow(response);

      expect(() async => await apiLoginDatasource.logout(),
          throwsA(isA<Exception>()));
    });
  });
}
