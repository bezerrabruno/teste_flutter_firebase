import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_flutter_firebase/app/domain/interfaces/login/login_repository.dart';
import 'package:teste_flutter_firebase/app/domain/usecases/login/logout_usecase.dart';

class MockLoginRepository extends Mock implements LoginRepository {}

class MockUser extends Mock implements User {}

void main() {
  group('LoginWithEmailUsecase', () {
    late MockLoginRepository mockLoginRepository;
    late LogoutUsecase logoutUsecase;

    setUp(() {
      mockLoginRepository = MockLoginRepository();
      logoutUsecase = LogoutUsecase(mockLoginRepository);
    });

    test('Deve retornar sucesso ao chamar o Usecase', () async {
      when(() => mockLoginRepository.logout()).thenAnswer((_) async => 1);

      try {
        final result = await logoutUsecase();
      } catch (e) {}
    });
  });
}
