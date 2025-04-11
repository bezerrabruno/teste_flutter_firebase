import 'package:dartz/dartz.dart';
import 'package:teste_flutter_firebase/app/core/entities/user_entity.dart';
import 'package:teste_flutter_firebase/app/modules/idea/domain/interfaces/idea_repository.dart';

class GetUserIdeaUsecase {
  final IdeaRepository _ideaRepository;

  const GetUserIdeaUsecase(
    this._ideaRepository,
  );

  Future<Either<Exception, UserEntity>> call({
    required int userId,
  }) async {
    return await _ideaRepository.getUser(userId);
  }
}
