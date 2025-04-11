import 'package:shared_preferences/shared_preferences.dart';

class KeyValueUtil {
  static Future<bool> getFingerprint() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool('fingerprint') ?? false;
  }

  static Future<bool> setFingerprint(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setBool('fingerprint', value);
  }
}
