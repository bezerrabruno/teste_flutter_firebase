import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_flutter_firebase/app/core/entities/profile_entity.dart';
import 'package:teste_flutter_firebase/app/domain/interfaces/usecase/profile_repository.dart';
import 'package:teste_flutter_firebase/app/domain/usecases/usecase/get_profile_usecase.dart';

class MockProfileRepository extends Mock implements ProfileRepository {}

void main() {
  group('GetProfileUsecase', () {
    late MockProfileRepository mockProfileRepository;
    late GetProfileUsecase getProfileUsecase;

    setUp(() {
      mockProfileRepository = MockProfileRepository();
      getProfileUsecase = GetProfileUsecase(mockProfileRepository);
    });

    test('Deve retornar sucesso ao chamar o Usecase', () async {
      when(() => mockProfileRepository.getProfile('000000'))
          .thenAnswer((_) async => Right(ProfileEntity(
                uid: '000000',
                name: 'name',
                username: 'username',
                age: 'age',
                qtd_posts: 0,
                likes: [],
              )));

      final result = await getProfileUsecase(uid: '000000');

      expect(result, isA<Right<Exception, ProfileEntity>>());
    });
  });
}
