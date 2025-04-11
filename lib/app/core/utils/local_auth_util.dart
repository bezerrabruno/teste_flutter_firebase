import 'package:local_auth/local_auth.dart';
import 'package:teste_flutter_firebase/app/core/utils/fingerprint/fingerprint_android_util.dart';
import 'package:teste_flutter_firebase/app/core/utils/fingerprint/fingerprint_ios_util.dart';

class LocalAuthUtil {
  static Future<bool> auth() async {
    final LocalAuthentication auth = LocalAuthentication();

    return await auth.authenticate(
      authMessages: [FingerprintIosUtil.call(), FingerprintAndroidUtil.call()],
      localizedReason: 'Faça autenticação para acessar o aplicativo',
    );
  }
}
