import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_flutter_firebase/app/domain/interfaces/login/login_repository.dart';
import 'package:teste_flutter_firebase/app/domain/usecases/login/login_with_email_usecase.dart';

class MockLoginRepository extends Mock implements LoginRepository {}

class MockUser extends Mock implements User {}

void main() {
  group('LoginWithEmailUsecase', () {
    late MockLoginRepository mockLoginRepository;
    late LoginWithEmailUsecase loginWithEmailUsecase;

    setUp(() {
      mockLoginRepository = MockLoginRepository();
      loginWithEmailUsecase = LoginWithEmailUsecase(mockLoginRepository);
    });

    test('Deve retornar sucesso ao chamar o Usecase', () async {
      when(() => mockLoginRepository.login(
              'login', '5f4dcc3b5aa765d61d8327deb882cf99'))
          .thenAnswer((_) async => Right(MockUser()));

      final result =
          await loginWithEmailUsecase(login: 'login', password: 'password');

      expect(result, isA<Right<Exception, User>>());
    });
  });
}
