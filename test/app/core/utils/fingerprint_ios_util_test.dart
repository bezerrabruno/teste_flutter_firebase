import 'package:flutter_test/flutter_test.dart';
import 'package:teste_flutter_firebase/app/core/utils/fingerprint/fingerprint_ios_util.dart';

void main() {
  group('FingerprintIosUtil | ', () {
    test('Deve retornar um IOSAuthMessages', () {
      expect(FingerprintIosUtil.call().cancelButton, 'Cancelar');
      expect(FingerprintIosUtil.call().goToSettingsButton, 'Configurações');
      expect(FingerprintIosUtil.call().goToSettingsDescription,
          'Por favor, faça autenticação com o Face ID');
    });
  });
}
