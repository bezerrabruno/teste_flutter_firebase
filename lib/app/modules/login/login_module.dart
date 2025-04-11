import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_flutter_firebase/app/core/firebase/authentication.dart';
import 'package:teste_flutter_firebase/app/modules/login/domain/login_with_email_usecase.dart';
import 'package:teste_flutter_firebase/app/modules/login/ui/controller/login_controller.dart';
import 'package:teste_flutter_firebase/app/modules/login/ui/pages/login_page.dart';

class LoginModule extends Module {
  @override
  void binds(i) {
    /// Auth
    i.addLazySingleton<Authentication>(Authentication.new);

    /// Usecase
    i.addLazySingleton<LoginWithEmailUsecase>(LoginWithEmailUsecase.new);

    /// Controller
    i.addLazySingleton<LoginController>(LoginController.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (_) => LoginPage(controller: Modular.get<LoginController>()),
      transition: TransitionType.rightToLeft,
      duration: const Duration(seconds: 1),
    );
  }
}
