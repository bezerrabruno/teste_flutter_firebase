import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

class Crashlytics {
  /// Se estiver em debug nao iniciara o Crashlytics.
  static Future<void> init() async {
    if (kDebugMode) {
      return;
    }

    FlutterError.onError =
        await FirebaseCrashlytics.instance.recordFlutterFatalError;

    /// Inicialização global para tratamento de [Exception].
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }
}
