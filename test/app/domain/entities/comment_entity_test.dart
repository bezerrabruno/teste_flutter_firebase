import 'package:flutter_test/flutter_test.dart';
import 'package:teste_flutter_firebase/app/domain/entities/comment_entity.dart';

void main() {
  group('CommentEntity', () {
    test('deve criar uma instância de CommentEntity a partir do construtor',
        () {
      final comment = CommentEntity(
        id: 1,
        name: 'name',
        body: 'body.',
      );

      expect(comment.id, 1);
      expect(comment.name, 'name');
      expect(comment.body, 'body.');
    });

    test('deve converter uma lista de map em uma lista de CommentEntity', () {
      final List<Map<String, dynamic>> commentMaps = [
        {'id': 1, 'name': 'name 1', 'body': 'body 1.'},
        {'id': 2, 'name': 'name 2', 'body': 'body 2.'},
      ];

      final comments = CommentEntity.fromList(commentMaps);

      expect(comments.length, 2);
      expect(comments[0].id, 1);
      expect(comments[0].body, 'body 1.');
      expect(comments[1].id, 2);
      expect(comments[1].body, 'body 2.');
    });

    test('deve retornar uma lista vazia se a lista de map for vazia', () {
      final comments = CommentEntity.fromList([]);

      expect(comments, isEmpty);
    });
  });
}
