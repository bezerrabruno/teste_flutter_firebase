import 'package:dartz/dartz.dart';
import 'package:teste_flutter_firebase/app/core/entities/profile_entity.dart';
import 'package:teste_flutter_firebase/app/modules/profile/domain/interfaces/profile_repository.dart';
import 'package:teste_flutter_firebase/app/modules/profile/infra/interfaces/external_profile_datasource.dart';

class DataProfileRepository implements ProfileRepository {
  final ExternalProfileDatasource _externalProfileDatasource;

  DataProfileRepository(this._externalProfileDatasource);

  @override
  Future<Either<Exception, ProfileEntity>> getProfile(String uid) async {
    try {
      final result = await _externalProfileDatasource.getProfile(uid);

      return Right(ProfileEntity.fromMap(uid, result));
    } catch (e) {
      return Left(
        Exception('DataProfileRepository: getUser Exception'),
      );
    }
  }

  @override
  Future<Either<Exception, ProfileEntity>> updateProfile(
      ProfileEntity profile) async {
    try {
      final result = await _externalProfileDatasource.updateProfile(profile);

      return Right(ProfileEntity.fromMap(profile.uid, result));
    } catch (e) {
      return Left(
        Exception('DataProfileRepository: updateUser Exception'),
      );
    }
  }
}
