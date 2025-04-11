import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_flutter_firebase/app/core/entities/company_entity.dart';
import 'package:teste_flutter_firebase/app/core/entities/user_entity.dart';
import 'package:teste_flutter_firebase/app/domain/interfaces/thought/thought_repository.dart';
import 'package:teste_flutter_firebase/app/domain/usecases/thought/get_user_thought_usecase.dart';

class MockThoughtRepository extends Mock implements ThoughtRepository {}

void main() {
  group('GetAllThoughtUsecase', () {
    late MockThoughtRepository mockThoughtRepository;
    late GetUserThoughtUsecase getUserThoughtUsecase;

    setUp(() {
      mockThoughtRepository = MockThoughtRepository();
      getUserThoughtUsecase = GetUserThoughtUsecase(mockThoughtRepository);
    });

    test('Deve retornar sucesso ao chamar o Usecase', () async {
      final user = UserEntity(
        id: 1,
        name: 'name',
        username: 'username',
        email: 'email',
        phone: 'phone',
        website: 'website',
        company: CompanyEntity(
          name: 'name',
          catchPhrase: 'catchPhrase',
          bs: 'bs',
        ),
      );

      when(() => mockThoughtRepository.getUser(1))
          .thenAnswer((_) async => Right(user));

      final result = await getUserThoughtUsecase(thoughtId: 1);

      expect(result, isA<Right<Exception, UserEntity>>());
    });
  });
}
