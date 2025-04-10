import 'package:dartz/dartz.dart';
import 'package:teste_flutter_firebase/app/domain/entities/profile_entity.dart';

abstract class ProfileRepository {
  Future<Either<Exception, ProfileEntity>> getProfile(String uid);

  Future<Either<Exception, ProfileEntity>> updateProfile(ProfileEntity user);
}
