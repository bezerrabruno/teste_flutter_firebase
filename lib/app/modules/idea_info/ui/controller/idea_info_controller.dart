import 'package:flutter/material.dart';
import 'package:teste_flutter_firebase/app/core/entities/comment_entity.dart';
import 'package:teste_flutter_firebase/app/core/entities/idea_entity.dart';
import 'package:teste_flutter_firebase/app/core/entities/user_entity.dart';
import 'package:teste_flutter_firebase/app/core/enum/page_state_enum.dart';
import 'package:teste_flutter_firebase/app/core/utils/show_toast_util.dart';
import 'package:teste_flutter_firebase/app/modules/idea_info/domain/usecases/get_comments_idea_usecase.dart';
import 'package:teste_flutter_firebase/app/modules/idea_info/domain/usecases/get_user_idea_usecase.dart';

class IdeaInfoController extends ChangeNotifier {
  final GetCommentsIdeaUsecase _getCommentsIdeaUsecase;
  final GetUserIdeaUsecase _getUserIdeaUsecase;

  IdeaInfoController(
    this._getCommentsIdeaUsecase,
    this._getUserIdeaUsecase,
  );

  PageStateEnum _pageState = PageStateEnum.initial;
  PageStateEnum get pageState => _pageState;

  final List<CommentEntity> comments = <CommentEntity>[];
  UserEntity? userEntity;

  Future<void> init(IdeaEntity args) async {
    _pageState = PageStateEnum.loading;
    notifyListeners();

    final resultComments = await _getCommentsIdeaUsecase(ideaId: args.id);

    resultComments.fold(
      (l) {
        _pageState = PageStateEnum.error;

        ShowToastUtil.error('Erro ao buscar informações, tente novamente.');
      },
      (r) {
        comments.addAll(r);
      },
    );

    final resultUser = await _getUserIdeaUsecase(userId: args.userId);

    resultUser.fold(
      (l) =>
          ShowToastUtil.error('Erro ao buscar informações, tente novamente.'),
      (r) {
        userEntity = r;
      },
    );

    _pageState = PageStateEnum.success;
    notifyListeners();
  }
}
