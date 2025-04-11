import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_flutter_firebase/app/modules/idea/idea_module.dart';
import 'package:teste_flutter_firebase/app/modules/idea_info/idea_info_module.dart';
import 'package:teste_flutter_firebase/app/modules/login/login_module.dart';
import 'package:teste_flutter_firebase/app/modules/profile/profile_module.dart';
import 'package:teste_flutter_firebase/app/modules/splash/splash_module.dart';
import 'package:teste_flutter_firebase/app/modules/user_info/user_info_module.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.module(Modular.initialRoute, module: SplashModule());
    r.module('/idea', module: IdeaModule());
    r.module('/idea_info', module: IdeaInfoModule());
    r.module('/login', module: LoginModule());
    r.module('/profile', module: ProfileModule());
    r.module('/user_info', module: UserInfoModule());
  }
}
