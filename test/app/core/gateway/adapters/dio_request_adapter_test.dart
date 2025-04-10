import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_flutter_firebase/app/core/gateway/adapters/dio_request_adapter.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('DioApiRequestAdapter', () {
    late MockDio mockDio;
    late DioApiRequestAdapter dioApiRequestAdapter;

    setUp(() {
      mockDio = MockDio();
      dioApiRequestAdapter = DioApiRequestAdapter(mockDio);
    });

    test('Deve retornar erro na req', () async {
      final path = 'https://example.com/data';

      final response = Response(
        statusCode: 404,
        requestOptions: RequestOptions(path: path),
      );

      when(() => mockDio.get(path)).thenAnswer((_) async => response);

      expect(() async => await dioApiRequestAdapter.get(path),
          throwsA(isA<Exception>()));
    });

    test('Deve retornar sucesso na req', () async {
      final path = 'https://example.com/data';

      final response = Response(
        data: {'key': 'value'},
        statusCode: 200,
        requestOptions: RequestOptions(path: path),
      );

      when(() => mockDio.get(path)).thenAnswer((_) async => response);

      final result = await dioApiRequestAdapter.get(path);

      expect(result, isA<Response>());
      expect(result.data, {'key': 'value'});
    });
  });

  group('DioApiRequestAdapter | Exception', () {
    late DioApiRequestAdapter dioApiRequestAdapter;
    late MockDio mockDio;

    setUp(() {
      mockDio = MockDio();
      dioApiRequestAdapter = DioApiRequestAdapter(mockDio);
    });

    test('Deve relançar erros de rede', () async {
      final path = 'https://example.com/data';

      final response = DioException(requestOptions: RequestOptions(path: path));

      when(() => mockDio.get(path)).thenThrow(response);

      expect(() async => await dioApiRequestAdapter.get(path),
          throwsA(isA<DioException>()));
    });
  });
}
