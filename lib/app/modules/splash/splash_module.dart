import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_flutter_firebase/app/modules/splash/ui/controller/splash_controller.dart';
import 'package:teste_flutter_firebase/app/modules/splash/ui/pages/splash_page.dart';

class SplashModule extends Module {
  @override
  void binds(i) {
    /// Controller
    i.addLazySingleton<SplashController>(SplashController.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (_) => SplashPage(
        controller: Modular.get<SplashController>(),
      ),
    );
  }
}
