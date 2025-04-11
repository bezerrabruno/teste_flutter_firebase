import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_flutter_firebase/app/core/utils/key_value_util.dart';
import 'package:teste_flutter_firebase/app/core/utils/local_auth_util.dart';

class SplashController extends ChangeNotifier {
  bool _animation = false;
  bool get animation => _animation;

  Future<void> init() async {
    await Future.delayed(Duration(seconds: 1), () {
      _animation = true;
      notifyListeners();
    });

    await Future.delayed(Duration(seconds: 2), () {
      _animation = false;
      notifyListeners();
    });

    await Future.delayed(Duration(seconds: 1), () {
      _validateFingerprint();
    });
  }

  Future<void> _validateFingerprint() async {
    final finger = await KeyValueUtil.getFingerprint();

    if (!finger) {
      Modular.to.navigate('/login/');

      return;
    }

    final auth = await LocalAuthUtil.auth();

    if (!auth) {
      Modular.to.navigate('/login/');

      return;
    }

    Modular.to.navigate('/home/');
  }
}
