import 'package:flutter_test/flutter_test.dart';
import 'package:teste_flutter_firebase/app/core/entities/idea_entity.dart';

void main() {
  group('IdeaEntity', () {
    test('deve criar uma instância de IdeaEntity a partir do construtor', () {
      final thought = IdeaEntity(
        id: 1,
        userId: 1,
        title: 'title',
        body: 'body.',
      );

      expect(thought.id, 1);
      expect(thought.userId, 1);
      expect(thought.title, 'title');
      expect(thought.body, 'body.');
    });

    test('deve converter uma lista de map em uma lista de IdeaEntity', () {
      final List<Map<String, dynamic>> thoughtMaps = [
        {'id': 1, 'userId': 1, 'title': 'title', 'body': 'body 1.'},
        {'id': 2, 'userId': 1, 'title': 'title', 'body': 'body 2.'},
      ];

      final thoughts = IdeaEntity.fromList(thoughtMaps);

      expect(thoughts.length, 2);
      expect(thoughts[0].id, 1);
      expect(thoughts[0].body, 'body 1.');
      expect(thoughts[1].id, 2);
      expect(thoughts[1].body, 'body 2.');
    });

    test('deve retornar uma lista vazia se a lista de map for vazia', () {
      final thoughts = IdeaEntity.fromList([]);

      expect(thoughts, isEmpty);
    });

    test(
        'deve converter uma lista de map em uma lista de IdeaEntity com filtro',
        () {
      final List<Map<String, dynamic>> thoughtMaps = [
        {'id': 1, 'userId': 1, 'title': 'title 1', 'body': 'body 1.'},
        {'id': 2, 'userId': 1, 'title': 'title 2', 'body': 'body 2.'},
      ];

      final thoughts = IdeaEntity.fromListWithFilter('titl', thoughtMaps);

      expect(thoughts.length, 2);
      expect(thoughts[0].id, 1);
      expect(thoughts[0].body, 'body 1.');
      expect(thoughts[1].id, 2);
      expect(thoughts[1].body, 'body 2.');
    });

    test('deve retornar uma lista vazia se a lista de map for vazia', () {
      final thoughts = IdeaEntity.fromListWithFilter('test', []);

      expect(thoughts, isEmpty);
    });
  });
}
