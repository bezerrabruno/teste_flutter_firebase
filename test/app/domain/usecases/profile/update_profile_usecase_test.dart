import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_flutter_firebase/app/domain/entities/profile_entity.dart';
import 'package:teste_flutter_firebase/app/domain/interfaces/profile/profile_repository.dart';
import 'package:teste_flutter_firebase/app/domain/usecases/profile/update_profile_usecase.dart';

class MockProfileRepository extends Mock implements ProfileRepository {}

void main() {
  group('UpdateProfileUsecase', () {
    late MockProfileRepository mockProfileRepository;
    late UpdateProfileUsecase updateProfileUsecase;

    setUp(() {
      mockProfileRepository = MockProfileRepository();
      updateProfileUsecase = UpdateProfileUsecase(mockProfileRepository);
    });

    test('Deve retornar sucesso ao chamar o Usecase', () async {
      final profile = ProfileEntity(
        uid: '000000',
        name: 'name',
        username: 'username',
        age: 'age',
        qtd_posts: 0,
        likes: [],
      );

      when(() => mockProfileRepository.updateProfile(profile))
          .thenAnswer((_) async => Right(profile));

      final result = await updateProfileUsecase(profile: profile);

      expect(result, isA<Right<Exception, ProfileEntity>>());
    });
  });
}
