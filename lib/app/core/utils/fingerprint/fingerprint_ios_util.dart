import 'package:local_auth_darwin/types/auth_messages_ios.dart';

class FingerprintIosUtil {
  static IOSAuthMessages call() => IOSAuthMessages(
        cancelButton: 'Cancelar',
        goToSettingsButton: 'Configurações',
        goToSettingsDescription: 'Por favor, faça autenticação com o Face ID',
      );
}
