import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_flutter_firebase/app/modules/profile/data/api_profile_datasource.dart';
import 'package:teste_flutter_firebase/app/modules/profile/domain/interfaces/profile_repository.dart';
import 'package:teste_flutter_firebase/app/modules/profile/domain/usecase/get_profile_usecase.dart';
import 'package:teste_flutter_firebase/app/modules/profile/domain/usecase/update_profile_usecase.dart';
import 'package:teste_flutter_firebase/app/modules/profile/infra/interfaces/external_profile_datasource.dart';
import 'package:teste_flutter_firebase/app/modules/profile/infra/repositories/data_profile_repository.dart';
import 'package:teste_flutter_firebase/app/modules/profile/ui/controller/profile_controller.dart';
import 'package:teste_flutter_firebase/app/modules/profile/ui/pages/profile_page.dart';

class ProfileModule extends Module {
  @override
  void binds(i) {
    /// Datasource
    i.addLazySingleton<ExternalProfileDatasource>(ApiProfileDatasource.new);

    /// Repository
    i.addLazySingleton<ProfileRepository>(DataProfileRepository.new);

    /// Usecase
    i.addLazySingleton<GetProfileUsecase>(GetProfileUsecase.new);
    i.addLazySingleton<UpdateProfileUsecase>(UpdateProfileUsecase.new);

    /// Controller
    i.addLazySingleton<ProfileController>(ProfileController.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (_) => ProfilePage(
        controller: Modular.get<ProfileController>(),
      ),
    );
  }
}
