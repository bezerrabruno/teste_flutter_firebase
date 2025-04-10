import 'package:dartz/dartz.dart';
import 'package:teste_flutter_firebase/app/domain/entities/comment_entity.dart';
import 'package:teste_flutter_firebase/app/domain/entities/thought_entity.dart';
import 'package:teste_flutter_firebase/app/domain/entities/user_entity.dart';

abstract class ThoughtRepository {
  Future<Either<Exception, List<ThoughtEntity>>> getAll();

  Future<Either<Exception, List<CommentEntity>>> getComments(int postId);

  Future<Either<Exception, UserEntity>> getUser(int userId);

  Future<Either<Exception, List<ThoughtEntity>>> searchByTitle(String title);
}
