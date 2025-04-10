import 'package:flutter_test/flutter_test.dart';
import 'package:teste_flutter_firebase/app/core/gateway/rotas/api_rotas_util.dart';

void main() {
  group('ApiRotasUtil | ', () {
    test('Deve retornar a URL de comentarios', () {
      expect(ApiRotasUtil.comments,
          'https://jsonplaceholder.typicode.com/comments');
    });

    test('Deve retornar a URL de pensamentos', () {
      expect(
          ApiRotasUtil.thoughts, 'https://jsonplaceholder.typicode.com/posts');
    });

    test('Deve retornar a URL de usuarios', () {
      expect(ApiRotasUtil.users, 'https://jsonplaceholder.typicode.com/users');
    });
  });
}
