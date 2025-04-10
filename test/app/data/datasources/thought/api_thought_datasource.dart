import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_flutter_firebase/app/core/gateway/interfaces/api_request_adapter.dart';
import 'package:teste_flutter_firebase/app/data/datasources/thought/api_thought_datasource.dart';
import 'package:teste_flutter_firebase/app/infra/interfaces/thought/thought_repository.dart';

class MockApiRequestAdapter extends Mock implements ApiRequestAdapter {}

void main() {
  group('ApiThoughtDatasource', () {
    late MockApiRequestAdapter mockApiRequestAdapter;
    late ExternalThoughtDatasource externalThoughtDatasource;

    setUp(() {
      mockApiRequestAdapter = MockApiRequestAdapter();
      externalThoughtDatasource = ApiThoughtDatasource(mockApiRequestAdapter);
    });

    test('Deve retornar sucesso ao buscar thought', () async {
      when(() => mockApiRequestAdapter.get(any()))
          .thenAnswer((_) async => <Map<String, dynamic>>[]);

      final result = await externalThoughtDatasource.getAll();

      expect(result, isA<List<Map<String, dynamic>>>());
    });

    test('Deve retornar sucesso ao buscar comments', () async {
      when(() => mockApiRequestAdapter.get(any()))
          .thenAnswer((_) async => <Map<String, dynamic>>[]);

      final result = await externalThoughtDatasource.getComments(1);

      expect(result, isA<List<Map<String, dynamic>>>());
    });

    test('Deve retornar sucesso ao buscar o user', () async {
      when(() => mockApiRequestAdapter.get(any())).thenAnswer((_) async => {});

      final result = await externalThoughtDatasource.getUser(1);

      expect(result, isA<Map<String, dynamic>>());
    });
  });

  group('DioApiRequestAdapter | Exception', () {
    late MockApiRequestAdapter mockApiRequestAdapter;
    late ExternalThoughtDatasource externalThoughtDatasource;

    setUp(() {
      mockApiRequestAdapter = MockApiRequestAdapter();
      externalThoughtDatasource = ApiThoughtDatasource(mockApiRequestAdapter);

      final response = Exception('Error');
      when(() => mockApiRequestAdapter.get(any())).thenThrow(response);
    });

    test('Deve retornar erros ao buscar thought', () async {
      expect(() async => await externalThoughtDatasource.getAll(),
          throwsA(isA<Exception>()));
    });

    test('Deve retornar sucesso ao buscar comments', () async {
      expect(() async => await externalThoughtDatasource.getComments(1),
          throwsA(isA<Exception>()));
    });

    test('Deve retornar sucesso ao buscar o user', () async {
      expect(() async => await externalThoughtDatasource.getUser(1),
          throwsA(isA<Exception>()));
    });
  });
}
