import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_flutter_firebase/app/core/entities/profile_entity.dart';
import 'package:teste_flutter_firebase/app/core/enum/page_state_enum.dart';
import 'package:teste_flutter_firebase/app/core/firebase/authentication.dart';
import 'package:teste_flutter_firebase/app/core/utils/key_value_util.dart';
import 'package:teste_flutter_firebase/app/core/utils/show_toast_util.dart';
import 'package:teste_flutter_firebase/app/modules/profile/domain/usecase/get_profile_usecase.dart';
import 'package:teste_flutter_firebase/app/modules/profile/domain/usecase/update_profile_usecase.dart';

class ProfileController extends ChangeNotifier {
  final GetProfileUsecase _getProfileUsecase;
  final UpdateProfileUsecase _updateProfileUsecase;

  ProfileController(
    this._getProfileUsecase,
    this._updateProfileUsecase,
  );

  PageStateEnum _pageState = PageStateEnum.initial;
  PageStateEnum get pageState => _pageState;

  bool _biometria = false;
  bool get biometria => _biometria;

  ProfileEntity? profileEntity;

  Future<void> init() async {
    _pageState = PageStateEnum.loading;
    notifyListeners();

    _biometria = await KeyValueUtil.getFingerprint();

    final user = await Authentication.getUser();

    final result = await _getProfileUsecase(uid: user!.uid);

    result.fold(
      (l) {
        ShowToastUtil.error('Erro ao buscar profile.');

        _pageState = PageStateEnum.loading;
        notifyListeners();
      },
      (r) {
        profileEntity = r;

        _pageState = PageStateEnum.success;
        notifyListeners();
      },
    );
  }

  Future<void> changeBiometria(bool value) async {
    _biometria = value;

    await KeyValueUtil.setFingerprint(value);

    notifyListeners();
  }

  Future<void> popAll() async {
    await Authentication.logout();

    Modular.to.navigate('/login/');
  }
}
