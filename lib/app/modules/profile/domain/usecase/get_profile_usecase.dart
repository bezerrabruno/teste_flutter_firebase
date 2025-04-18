import 'package:dartz/dartz.dart';
import 'package:teste_flutter_firebase/app/core/entities/profile_entity.dart';
import 'package:teste_flutter_firebase/app/modules/profile/domain/interfaces/profile_repository.dart';

class GetProfileUsecase {
  final ProfileRepository _profileRepository;

  const GetProfileUsecase(
    this._profileRepository,
  );

  Future<Either<Exception, ProfileEntity>> call({required String uid}) async {
    return await _profileRepository.getProfile(uid);
  }
}
