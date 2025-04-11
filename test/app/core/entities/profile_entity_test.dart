import 'package:flutter_test/flutter_test.dart';
import 'package:teste_flutter_firebase/app/core/entities/profile_entity.dart';

void main() {
  group('CompanyEntity', () {
    test('deve criar uma instância de ProfileEntity a partir do construtor',
        () {
      final profile = ProfileEntity(
        uid: 'uid',
        name: 'name',
        username: 'username',
        age: '20',
        qtd_posts: 0,
        likes: [],
      );

      expect(profile.uid, 'uid');
      expect(profile.name, 'name');
      expect(profile.username, 'username');
      expect(profile.age, '20');
      expect(profile.qtd_posts, 0);
      expect(profile.likes.length, 0);
    });

    test('deve criar uma instância de ProfileEntity a partir de um map', () {
      final Map<String, dynamic> map = {
        'name': 'name',
        'username': 'username',
        'age': '20',
        'qtd_posts': 0,
        'likes': <String>[],
      };

      final profile = ProfileEntity.fromMap('00000', map);

      expect(profile.uid, '00000');
      expect(profile.name, 'name');
      expect(profile.username, 'username');
      expect(profile.age, '20');
      expect(profile.qtd_posts, 0);
      expect(profile.likes.length, 0);
    });

    test('deve criar uma map a partir da classe ProfileEntity', () {
      final profile = ProfileEntity(
        uid: 'uid',
        name: 'name',
        username: 'username',
        age: '20',
        qtd_posts: 0,
        likes: [],
      );

      final map = profile.toMap();

      expect(map['name'], 'name');
      expect(map['username'], 'username');
      expect(map['age'], '20');
      expect(map['qtd_posts'], 0);
      expect(map['likes'].length, 0);
    });
  });
}
