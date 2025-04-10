import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_flutter_firebase/app/domain/entities/comment_entity.dart';
import 'package:teste_flutter_firebase/app/domain/entities/thought_entity.dart';
import 'package:teste_flutter_firebase/app/domain/entities/user_entity.dart';
import 'package:teste_flutter_firebase/app/domain/interfaces/thought/thought_repository.dart';
import 'package:teste_flutter_firebase/app/infra/interfaces/thought/thought_repository.dart';
import 'package:teste_flutter_firebase/app/infra/repositories/thought/data_thought_repository.dart';

class MockExternalThoughtDatasource extends Mock
    implements ExternalThoughtDatasource {}

void main() {
  group('ThoughtRepository', () {
    late MockExternalThoughtDatasource mockExternalThoughtDatasource;
    late ThoughtRepository thoughtRepository;

    setUp(() {
      mockExternalThoughtDatasource = MockExternalThoughtDatasource();
      thoughtRepository = DataThoughtRepository(mockExternalThoughtDatasource);
    });

    test('Deve retornar sucesso ao chamar getAll', () async {
      final List<Map<String, dynamic>> maps = [
        {'id': 1, 'userId': 1, 'title': 'title', 'body': 'body 1.'},
        {'id': 2, 'userId': 1, 'title': 'title', 'body': 'body 2.'},
      ];

      when(() => mockExternalThoughtDatasource.getAll())
          .thenAnswer((_) async => maps);

      final result = await thoughtRepository.getAll();

      expect(result, isA<Right<Exception, List<ThoughtEntity>>>());
    });

    test('Deve retornar sucesso ao chamar getComments', () async {
      final List<Map<String, dynamic>> maps = [
        {'id': 1, 'name': 'name', 'body': 'body 1.'},
        {'id': 2, 'name': 'name', 'body': 'body 2.'},
      ];

      when(() => mockExternalThoughtDatasource.getComments(1))
          .thenAnswer((_) async => maps);

      final result = await thoughtRepository.getComments(1);

      expect(result, isA<Right<Exception, List<CommentEntity>>>());
    });

    test('Deve retornar sucesso ao chamar getUser', () async {
      final Map<String, dynamic> map = {
        'id': 1,
        'name': 'name',
        'username': 'username',
        'email': 'email',
        'phone': 'phone',
        'website': 'website',
        'company': {
          'name': 'name',
          'catchPhrase': 'catchPhrase',
          'bs': 'bs',
        }
      };

      when(() => mockExternalThoughtDatasource.getUser(1))
          .thenAnswer((_) async => map);

      final result = await thoughtRepository.getUser(1);

      expect(result, isA<Right<Exception, UserEntity>>());
    });
  });

  group('ThoughtRepository | Exception', () {
    late MockExternalThoughtDatasource mockExternalThoughtDatasource;
    late ThoughtRepository thoughtRepository;

    setUp(() {
      mockExternalThoughtDatasource = MockExternalThoughtDatasource();
      thoughtRepository = DataThoughtRepository(mockExternalThoughtDatasource);
    });

    test('Deve retornar sucesso ao chamar getAll', () async {
      final response = Exception('Error');

      when(() => mockExternalThoughtDatasource.getAll()).thenThrow(response);

      final result = await thoughtRepository.getAll();

      expect(result, isA<Left<Exception, List<ThoughtEntity>>>());
    });

    test('Deve retornar sucesso ao chamar getComments', () async {
      final response = Exception('Error');

      when(() => mockExternalThoughtDatasource.getComments(1))
          .thenThrow(response);

      final result = await thoughtRepository.getComments(1);

      expect(result, isA<Left<Exception, List<CommentEntity>>>());
    });

    test('Deve retornar sucesso ao chamar getUser', () async {
      final response = Exception('Error');

      when(() => mockExternalThoughtDatasource.getUser(1)).thenThrow(response);

      final result = await thoughtRepository.getUser(1);

      expect(result, isA<Left<Exception, UserEntity>>());
    });
  });
}
