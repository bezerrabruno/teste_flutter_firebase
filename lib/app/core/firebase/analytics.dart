import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Analytics {
  static Future<void> init() async {
    await FirebaseAnalytics.instance.logAppOpen();

    /// Mapeamento de navegação.
    Modular.to.addListener(() {
      _sendPage(Modular.to.path);
    });
  }

  /// Função padrao para envio de analise, info deve ser uma breve descrição e bem intuitiva,
  /// pois isso que vai contar para relatorios mais longos
  /// Se estiver em debug nao enviara os Logs.
  static Future<void> sendInfo(
    String info, {
    Map<String, Object>? parameters,
  }) async {
    if (kDebugMode) {
      return;
    }

    await FirebaseAnalytics.instance.logEvent(
      name: info,
      parameters: parameters,
    );
  }

  /// Se estiver em debug nao enviara os Logs.
  static Future<void> _sendPage(String page) async {
    if (kDebugMode) {
      return;
    }

    await FirebaseAnalytics.instance.logEvent(
      name: 'page_${page.substring(1, page.length - 1)}',
    );
  }
}
