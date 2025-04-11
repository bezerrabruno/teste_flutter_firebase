import 'package:flutter/material.dart';
import 'package:teste_flutter_firebase/app/core/enum/page_state_enum.dart';
import 'package:teste_flutter_firebase/app/modules/idea_info/domain/usecases/get_comments_idea_usecase.dart';
import 'package:teste_flutter_firebase/app/modules/idea_info/domain/usecases/get_user_idea_usecase.dart';

class UserInfoController extends ChangeNotifier {
  final GetCommentsIdeaUsecase _getCommentsIdeaUsecase;
  final GetUserIdeaUsecase _getUserIdeaUsecase;

  UserInfoController(
    this._getCommentsIdeaUsecase,
    this._getUserIdeaUsecase,
  );

  PageStateEnum _pageState = PageStateEnum.initial;
  PageStateEnum get pageState => _pageState;

  Future<void> init() async {
    _pageState = PageStateEnum.loading;
    notifyListeners();
  }
}
