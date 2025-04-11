import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_flutter_firebase/app/core/gateway/adapters/dio_request_adapter.dart';
import 'package:teste_flutter_firebase/app/core/gateway/interfaces/api_request_adapter.dart';
import 'package:teste_flutter_firebase/app/modules/idea/data/api_idea_datasource.dart';
import 'package:teste_flutter_firebase/app/modules/idea/domain/interfaces/idea_repository.dart';
import 'package:teste_flutter_firebase/app/modules/idea/domain/usecases/get_all_idea_usecase.dart';
import 'package:teste_flutter_firebase/app/modules/idea/infra/interfaces/external_idea_repository.dart';
import 'package:teste_flutter_firebase/app/modules/idea/infra/repository/data_idea_repository.dart';
import 'package:teste_flutter_firebase/app/modules/idea/ui/controller/idea_controller.dart';
import 'package:teste_flutter_firebase/app/modules/idea/ui/pages/idea_page.dart';

class IdeaModule extends Module {
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
    i.addLazySingleton<GetAllIdedaUsecase>(GetAllIdedaUsecase.new);

    /// Controller
    i.addLazySingleton<IdeaController>(IdeaController.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (_) => IdeaPage(
        controller: Modular.get<IdeaController>(),
      ),
    );
  }
}
