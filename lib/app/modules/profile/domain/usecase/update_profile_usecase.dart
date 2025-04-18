import 'package:dartz/dartz.dart';
import 'package:teste_flutter_firebase/app/core/entities/profile_entity.dart';
import 'package:teste_flutter_firebase/app/modules/profile/domain/interfaces/profile_repository.dart';

class UpdateProfileUsecase {
  final ProfileRepository _profileRepository;

  const UpdateProfileUsecase(
    this._profileRepository,
  );

  Future<Either<Exception, ProfileEntity>> call({
    required ProfileEntity profile,
  }) async {
    return await _profileRepository.updateProfile(profile);
  }
}
