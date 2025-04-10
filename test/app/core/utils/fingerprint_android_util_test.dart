import 'package:flutter_test/flutter_test.dart';
import 'package:teste_flutter_firebase/app/core/utils/fingerprint/fingerprint_android_util.dart';

void main() {
  group('FingerprintAndroidUtil | ', () {
    test('Deve retornar um AndroidAuthMessages', () {
      expect(FingerprintAndroidUtil.call().signInTitle, 'Biometria');
      expect(FingerprintAndroidUtil.call().cancelButton, 'Cancelar');
      expect(FingerprintAndroidUtil.call().goToSettingsButton, 'Configurações');
      expect(FingerprintAndroidUtil.call().goToSettingsDescription,
          'Por favor, faça autenticação com sua digital!');
    });
  });
}
