import 'package:dartz/dartz.dart';
import 'package:teste_flutter_firebase/app/domain/entities/user_entity.dart';
import 'package:teste_flutter_firebase/app/domain/interfaces/thought/thought_repository.dart';

class GetUserThoughtUsecase {
  final ThoughtRepository _thoughtRepository;

  const GetUserThoughtUsecase(
    this._thoughtRepository,
  );

  Future<Either<Exception, UserEntity>> call({
    required int thoughtId,
  }) async {
    return await _thoughtRepository.getUser(thoughtId);
  }
}
