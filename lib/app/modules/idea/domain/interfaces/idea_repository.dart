import 'package:dartz/dartz.dart';
import 'package:teste_flutter_firebase/app/core/entities/comment_entity.dart';
import 'package:teste_flutter_firebase/app/core/entities/idea_entity.dart';
import 'package:teste_flutter_firebase/app/core/entities/user_entity.dart';

abstract class IdeaRepository {
  Future<Either<Exception, List<IdeaEntity>>> getAll();

  Future<Either<Exception, List<CommentEntity>>> getComments(int ideaId);

  Future<Either<Exception, UserEntity>> getUser(int userId);

  Future<Either<Exception, List<IdeaEntity>>> searchByTitle(String title);
}
