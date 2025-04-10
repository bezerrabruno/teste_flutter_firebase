import 'package:dartz/dartz.dart';
import 'package:teste_flutter_firebase/app/domain/entities/comment_entity.dart';
import 'package:teste_flutter_firebase/app/domain/interfaces/thought/thought_repository.dart';

class GetCommentsThoughtUsecase {
  final ThoughtRepository _thoughtRepository;

  const GetCommentsThoughtUsecase(
    this._thoughtRepository,
  );

  Future<Either<Exception, List<CommentEntity>>> call({
    required int postId,
  }) async {
    return await _thoughtRepository.getComments(postId);
  }
}
