import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_flutter_firebase/app/core/utils/key_value_util.dart';
import 'package:teste_flutter_firebase/app/core/utils/local_auth_util.dart';
import 'package:teste_flutter_firebase/app/core/utils/show_toast_util.dart';
import 'package:teste_flutter_firebase/app/modules/login/domain/login_with_email_usecase.dart';

class LoginController extends ChangeNotifier {
  final LoginWithEmailUsecase loginWithEmailUsecase;

  LoginController(this.loginWithEmailUsecase);

  final TextEditingController cEmail =
      TextEditingController(text: 'tester@email.com.br');
  final TextEditingController cPassword = TextEditingController(text: '1234');

  final FocusNode nodeEmail = FocusNode();
  final FocusNode nodePassword = FocusNode();

  bool _obscurePass = true;
  bool get obscurePass => _obscurePass;

  bool _loadLogin = false;
  bool get loadLogin => _loadLogin;

  void changeObscurePass() {
    _obscurePass = !_obscurePass;
    notifyListeners();
  }

  Future<void> validateLogin() async {
    _loadLogin = true;
    notifyListeners();

    if (cEmail.text.isEmpty || cPassword.text.isEmpty) {
      ShowToastUtil.error('login e senha obrigatórios.');

      _loadLogin = false;
      notifyListeners();
      return;
    }

    final result = await loginWithEmailUsecase(
        login: cEmail.text, password: cPassword.text);

    result.fold(
      (l) {
        ShowToastUtil.error('login e/ou senha incorreto(s).');
      },
      (r) => Modular.to.navigate('/idea/'),
    );

    _loadLogin = false;
    notifyListeners();
  }

  void navigateRegister() => ShowToastUtil.warning('Funcionalidade Inativa.');

  Future<void> validateFingerprint() async {
    final finger = await KeyValueUtil.getFingerprint();

    if (!finger) {
      return;
    }

    final auth = await LocalAuthUtil.auth();

    if (!auth) {
      return;
    }

    Modular.to.navigate('/home/');
  }
}
