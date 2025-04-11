import 'package:flutter_test/flutter_test.dart';
import 'package:teste_flutter_firebase/app/core/entities/company_entity.dart';

void main() {
  group('CompanyEntity', () {
    test('deve criar uma instância de CompanyEntity a partir do construtor',
        () {
      final company =
          CompanyEntity(name: 'name', catchPhrase: 'catchPhrase.', bs: 'bs.');

      expect(company.name, 'name');
      expect(company.catchPhrase, 'catchPhrase.');
      expect(company.bs, 'bs.');
    });

    test('deve criar uma instância de CompanyEntity a partir de um map', () {
      final Map<String, dynamic> map = {
        'name': 'name',
        'catchPhrase': 'catchPhrase.',
        'bs': 'bs.',
      };

      final company = CompanyEntity.fromMap(map);

      expect(company.name, 'name');
      expect(company.catchPhrase, 'catchPhrase.');
      expect(company.bs, 'bs.');
    });
  });
}
