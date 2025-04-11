import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_flutter_firebase/app/core/gateway/adapters/dio_request_adapter.dart';
import 'package:teste_flutter_firebase/app/core/gateway/interfaces/api_request_adapter.dart';
import 'package:teste_flutter_firebase/app/modules/idea/data/api_idea_datasource.dart';
import 'package:teste_flutter_firebase/app/modules/idea/domain/interfaces/idea_repository.dart';
import 'package:teste_flutter_firebase/app/modules/idea/infra/interfaces/external_idea_repository.dart';
import 'package:teste_flutter_firebase/app/modules/idea/infra/repository/data_idea_repository.dart';
import 'package:teste_flutter_firebase/app/modules/idea_info/domain/usecases/get_comments_idea_usecase.dart';
import 'package:teste_flutter_firebase/app/modules/idea_info/domain/usecases/get_user_idea_usecase.dart';
import 'package:teste_flutter_firebase/app/modules/idea_info/ui/controller/idea_info_controller.dart';
import 'package:teste_flutter_firebase/app/modules/idea_info/ui/pages/idea_info_page.dart';

class IdeaInfoModule extends Module {
  @override
  void binds(i) {
    /// Dio
    i.addLazySingleton<Dio>(() => Dio());

    /// Adapter
    i.addLazySingleton<ApiRequestAdapter>(DioApiRequestAdapter.new);

    /// Datasource
    i.addLazySingleton<ExternalIdeaDatasource>(ApiIdeaDatasource.new);

    /// Repository
    i.addLazySingleton<IdeaRepository>(DataIdeaRepository.new);

    /// Usecase
    i.addLazySingleton<GetCommentsIdeaUsecase>(GetCommentsIdeaUsecase.new);
    i.addLazySingleton<GetUserIdeaUsecase>(GetUserIdeaUsecase.new);

    /// Controller
    i.addLazySingleton<IdeaInfoController>(IdeaInfoController.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (_) => IdeaInfoPage(
        args: r.args.data,
        controller: Modular.get<IdeaInfoController>(),
      ),
    );
  }
}
