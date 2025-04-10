import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_flutter_firebase/app/domain/entities/profile_entity.dart';
import 'package:teste_flutter_firebase/app/domain/interfaces/profile/profile_repository.dart';
import 'package:teste_flutter_firebase/app/infra/interfaces/profile/external_profile_datasource.dart';
import 'package:teste_flutter_firebase/app/infra/repositories/profile/data_profile_repository.dart';

class MockExternalProfileDatasource extends Mock
    implements ExternalProfileDatasource {}

void main() {
  group('ProfileRepository', () {
    late MockExternalProfileDatasource mockExternalProfileDatasource;
    late ProfileRepository profileRepository;

    setUp(() {
      mockExternalProfileDatasource = MockExternalProfileDatasource();
      profileRepository = DataProfileRepository(mockExternalProfileDatasource);
    });

    test('Deve retornar sucesso ao chamar getUser', () async {
      final Map<String, dynamic> map = {
        'name': 'name',
        'username': 'username',
        'age': '20',
        'qtd_posts': 0,
        'likes': <String>[],
      };

      when(() => mockExternalProfileDatasource.getProfile('000000'))
          .thenAnswer((_) async => map);

      final result = await profileRepository.getProfile('000000');

      expect(result, isA<Right<Exception, ProfileEntity>>());
    });

    test('Deve retornar sucesso ao chamar updateUser', () async {
      final Map<String, dynamic> map = {
        'name': 'name',
        'username': 'username',
        'age': '20',
        'qtd_posts': 0,
        'likes': <String>[],
      };

      final profile = ProfileEntity.fromMap('000000', map);

      when(() => mockExternalProfileDatasource.updateProfile(profile))
          .thenAnswer((_) async => map);

      final result = await profileRepository.updateProfile(profile);

      expect(result, isA<Right<Exception, ProfileEntity>>());
    });
  });

  group('ProfileRepository | Exception', () {
    late MockExternalProfileDatasource mockExternalProfileDatasource;
    late ProfileRepository profileRepository;

    setUp(() {
      mockExternalProfileDatasource = MockExternalProfileDatasource();
      profileRepository = DataProfileRepository(mockExternalProfileDatasource);
    });

    test('Deve retornar erro ao chamar getUser', () async {
      final response = Exception('Error');

      when(() => mockExternalProfileDatasource.getProfile('000000'))
          .thenThrow(response);

      final result = await profileRepository.getProfile('000000');

      expect(result, isA<Left<Exception, ProfileEntity>>());
    });

    test('Deve retornar erro ao chamar updateUser', () async {
      final response = Exception('Error');

      final profile = ProfileEntity(
        uid: '000000',
        name: 'name',
        username: 'username',
        age: 'age',
        qtd_posts: 0,
        likes: [],
      );

      when(() => mockExternalProfileDatasource.updateProfile(profile))
          .thenThrow(response);

      final result = await profileRepository.updateProfile(profile);

      expect(result, isA<Left<Exception, ProfileEntity>>());
    });
  });
}
