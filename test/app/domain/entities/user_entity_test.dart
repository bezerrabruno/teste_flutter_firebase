import 'package:flutter_test/flutter_test.dart';
import 'package:teste_flutter_firebase/app/domain/entities/company_entity.dart';
import 'package:teste_flutter_firebase/app/domain/entities/user_entity.dart';

void main() {
  group('CompanyEntity', () {
    test('deve criar uma instância de UserEntity a partir do construtor', () {
      final user = UserEntity(
        id: 1,
        name: 'name',
        username: 'username',
        email: 'email',
        phone: 'phone',
        website: 'website',
        company: CompanyEntity(
          name: 'name',
          catchPhrase: 'catchPhrase',
          bs: 'bs',
        ),
      );

      expect(user.id, 1);
      expect(user.name, 'name');
      expect(user.username, 'username');
      expect(user.email, 'email');
      expect(user.phone, 'phone');
      expect(user.website, 'website');
      expect(user.company.name, 'name');
      expect(user.company.catchPhrase, 'catchPhrase');
      expect(user.company.bs, 'bs');
    });

    test('deve criar uma instância de UserEntity a partir de um map', () {
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

      final user = UserEntity.fromMap(map);

      expect(user.id, 1);
      expect(user.name, 'name');
      expect(user.username, 'username');
      expect(user.email, 'email');
      expect(user.phone, 'phone');
      expect(user.website, 'website');
      expect(user.company.name, 'name');
      expect(user.company.catchPhrase, 'catchPhrase');
      expect(user.company.bs, 'bs');
    });
  });
}
