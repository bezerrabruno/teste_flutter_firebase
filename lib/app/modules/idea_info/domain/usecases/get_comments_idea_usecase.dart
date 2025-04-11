import 'package:dartz/dartz.dart';
import 'package:teste_flutter_firebase/app/core/entities/comment_entity.dart';
import 'package:teste_flutter_firebase/app/modules/idea/domain/interfaces/idea_repository.dart';

class GetCommentsIdeaUsecase {
  final IdeaRepository _ideaRepository;

  const GetCommentsIdeaUsecase(
    this._ideaRepository,
  );

  Future<Either<Exception, List<CommentEntity>>> call({
    required int ideaId,
  }) async {
    return await _ideaRepository.getComments(ideaId);
  }
}
