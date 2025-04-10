import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_flutter_firebase/app/module/home/home_module.dart';
import 'package:teste_flutter_firebase/app/module/login/login_module.dart';
import 'package:teste_flutter_firebase/app/module/splash/splash_module.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.module(Modular.initialRoute, module: SplashModule());
    r.module('/home', module: HomeModule());
    r.module('/login', module: LoginModule());
    // r.module('/profile', module: ProfileModule());
    // r.module('/search', module: SearchModule());
    // r.module('/thought', module: ThoughtModule());
  }
}
