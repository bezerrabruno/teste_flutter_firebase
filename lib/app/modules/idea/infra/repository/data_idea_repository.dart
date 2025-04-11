import 'package:dartz/dartz.dart';
import 'package:teste_flutter_firebase/app/core/entities/comment_entity.dart';
import 'package:teste_flutter_firebase/app/core/entities/idea_entity.dart';
import 'package:teste_flutter_firebase/app/core/entities/user_entity.dart';
import 'package:teste_flutter_firebase/app/modules/idea/domain/interfaces/idea_repository.dart';
import 'package:teste_flutter_firebase/app/modules/idea/infra/interfaces/external_idea_repository.dart';

class DataIdeaRepository implements IdeaRepository {
  final ExternalIdeaDatasource _externalThoughtDatasource;

  DataIdeaRepository(this._externalThoughtDatasource);

  @override
  Future<Either<Exception, List<IdeaEntity>>> getAll() async {
    try {
      final result = await _externalThoughtDatasource.getAll();

      return Right(IdeaEntity.fromList(result));
    } catch (e) {
      return Left(
        Exception('DataIdeaRepository: getAll Exception'),
      );
    }
  }

  @override
  Future<Either<Exception, List<CommentEntity>>> getComments(int postId) async {
    try {
      final result = await _externalThoughtDatasource.getComments(postId);

      return Right(CommentEntity.fromList(result));
    } catch (e) {
      return Left(
        Exception('DataIdeaRepository: getComments Exception'),
      );
    }
  }

  @override
  Future<Either<Exception, UserEntity>> getUser(int userId) async {
    try {
      final result = await _externalThoughtDatasource.getUser(userId);

      return Right(UserEntity.fromMap(result));
    } catch (e) {
      return Left(
        Exception('DataIdeaRepository: getUser Exception'),
      );
    }
  }

  @override
  Future<Either<Exception, List<IdeaEntity>>> searchByTitle(
    String title,
  ) async {
    try {
      final result = await _externalThoughtDatasource.getAll();

      return Right(IdeaEntity.fromListWithFilter(title, result));
    } catch (e) {
      return Left(
        Exception('DataIdeaRepository: searchByTitle Exception'),
      );
    }
  }
}
