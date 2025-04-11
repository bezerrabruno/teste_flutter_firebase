import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_flutter_firebase/app/modules/idea_info/ui/controller/idea_info_controller.dart';
import 'package:teste_flutter_firebase/app/modules/user_info/ui/pages/user_info_page.dart';

class UserInfoModule extends Module {
  @override
  void binds(i) {
    /// Controller
    i.addLazySingleton<IdeaInfoController>(IdeaInfoController.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (_) => UserInfoPage(
        controller: Modular.get<IdeaInfoController>(),
      ),
    );
  }
}
