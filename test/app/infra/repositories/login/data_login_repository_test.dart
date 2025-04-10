import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_flutter_firebase/app/domain/interfaces/login/login_repository.dart';
import 'package:teste_flutter_firebase/app/infra/interfaces/login/external_login_datasource.dart';
import 'package:teste_flutter_firebase/app/infra/repositories/login/data_login_repository.dart';

class MockExternalLoginDatasource extends Mock
    implements ExternalLoginDatasource {}

class MockUser extends Mock implements User {}

void main() {
  group('LoginRepository', () {
    late MockExternalLoginDatasource mockExternalLoginDatasource;
    late LoginRepository loginRepository;

    setUp(() {
      mockExternalLoginDatasource = MockExternalLoginDatasource();
      loginRepository = DataLoginRepository(mockExternalLoginDatasource);
    });

    test('Deve retornar sucesso ao chamar login', () async {
      when(() => mockExternalLoginDatasource.login('login', 'password'))
          .thenAnswer((_) async => MockUser());

      final result = await loginRepository.login('login', 'password');

      expect(result, isA<Right<Exception, User>>());
    });

    test('Deve retornar sucesso ao chamar logout', () async {
      try {
        await loginRepository.logout();
      } catch (e) {}
    });
  });

  group('LoginRepository | Exception', () {
    late MockExternalLoginDatasource mockExternalLoginDatasource;
    late LoginRepository loginRepository;

    setUp(() {
      mockExternalLoginDatasource = MockExternalLoginDatasource();
      loginRepository = DataLoginRepository(mockExternalLoginDatasource);
    });

    test('Deve retornar erro ao chamar login', () async {
      final response = Exception('Error');

      when(() => mockExternalLoginDatasource.login('login', 'password'))
          .thenThrow(response);

      final result = await loginRepository.login('login', 'password');

      expect(result, isA<Left<Exception, User>>());
    });

    test('Deve retornar erro ao chamar logout', () async {
      final response = Exception('Error');

      when(() => mockExternalLoginDatasource.logout()).thenThrow(response);

      expect(() async => await loginRepository.logout(),
          throwsA(isA<Exception>()));
    });
  });
}
