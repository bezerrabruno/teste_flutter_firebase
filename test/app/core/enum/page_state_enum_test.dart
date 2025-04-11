import 'package:flutter_test/flutter_test.dart';
import 'package:teste_flutter_firebase/app/core/enum/page_state_enum.dart';

void main() {
  group('PageStateEnum', () {
    test('Deve conter o número correto de valores', () {
      expect(PageStateEnum.values.length, 5);
    });

    test('Deve retornar o valor correspondente', () {
      expect(PageStateEnum.initial, PageStateEnum.values[0]);
      expect(PageStateEnum.loading, PageStateEnum.values[1]);
      expect(PageStateEnum.error, PageStateEnum.values[2]);
      expect(PageStateEnum.empty, PageStateEnum.values[3]);
      expect(PageStateEnum.success, PageStateEnum.values[4]);
    });

    test('Deve retornar o valor das Strings correspondentes', () {
      expect(PageStateEnum.initial.toString(), 'PageStateEnum.initial');
      expect(PageStateEnum.loading.toString(), 'PageStateEnum.loading');
      expect(PageStateEnum.error.toString(), 'PageStateEnum.error');
      expect(PageStateEnum.empty.toString(), 'PageStateEnum.empty');
      expect(PageStateEnum.success.toString(), 'PageStateEnum.success');
    });
  });
}
