import 'package:teste_flutter_firebase/app/domain/interfaces/login/login_repository.dart';

class LogoutUsecase {
  final LoginRepository _loginRepository;

  const LogoutUsecase(
    this._loginRepository,
  );

  Future<void> call() async {
    return await _loginRepository.logout();
  }
}
