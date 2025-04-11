import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_flutter_firebase/app/core/entities/idea_entity.dart';
import 'package:teste_flutter_firebase/app/core/enum/page_state_enum.dart';
import 'package:teste_flutter_firebase/app/core/firebase/authentication.dart';
import 'package:teste_flutter_firebase/app/core/utils/show_toast_util.dart';
import 'package:teste_flutter_firebase/app/modules/idea/domain/usecases/get_all_idea_usecase.dart';

class IdeaController extends ChangeNotifier {
  final GetAllIdedaUsecase _getAllIdedaUsecase;

  IdeaController(
    this._getAllIdedaUsecase,
  );

  PageStateEnum _pageState = PageStateEnum.initial;
  PageStateEnum get pageState => _pageState;

  final List<IdeaEntity> ideas = <IdeaEntity>[];
  final List<IdeaEntity> filterIdeas = <IdeaEntity>[];

  Future<void> init() async {
    _pageState = PageStateEnum.loading;
    notifyListeners();

    await Future.delayed(Duration(seconds: 2));

    final result = await _getAllIdedaUsecase();

    result.fold(
      (l) {
        ShowToastUtil.error('Erro ao buscar posts.');

        _pageState = PageStateEnum.loading;
        notifyListeners();
      },
      (r) {
        ideas.addAll(r);
        filterIdeas.addAll(r.sublist(0, 9));

        _pageState = PageStateEnum.success;
        notifyListeners();
      },
    );
  }

  void navigateProfile() => Modular.to.pushNamed('/profile/');

  void navigateInfo(IdeaEntity idea) =>
      Modular.to.pushNamed('/idea_info/', arguments: idea);

  void pop() => Modular.to.pop();

  Future<void> popAll() async {
    await Authentication.logout();

    Modular.to.navigate('/login/');
  }
}
