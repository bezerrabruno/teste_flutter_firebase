import 'package:local_auth_android/local_auth_android.dart';

class FingerprintAndroidUtil {
  static AndroidAuthMessages call() => AndroidAuthMessages(
        signInTitle: 'Biometria',
        cancelButton: 'Cancelar',
        biometricRequiredTitle: '',
        biometricHint: '',
        biometricSuccess: '',
        biometricNotRecognized: '',
        deviceCredentialsSetupDescription: '',
        deviceCredentialsRequiredTitle: '',
        goToSettingsButton: 'Configurações',
        goToSettingsDescription:
            'Por favor, faça autenticação com sua digital!',
      );
}
