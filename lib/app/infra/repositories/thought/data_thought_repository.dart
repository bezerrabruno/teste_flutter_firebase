import 'package:dartz/dartz.dart';
import 'package:teste_flutter_firebase/app/domain/entities/comment_entity.dart';
import 'package:teste_flutter_firebase/app/domain/entities/thought_entity.dart';
import 'package:teste_flutter_firebase/app/domain/entities/user_entity.dart';
import 'package:teste_flutter_firebase/app/domain/interfaces/thought/thought_repository.dart';
import 'package:teste_flutter_firebase/app/infra/interfaces/thought/thought_repository.dart';

class DataThoughtRepository implements ThoughtRepository {
  final ExternalThoughtDatasource _externalThoughtDatasource;

  DataThoughtRepository(this._externalThoughtDatasource);

  @override
  Future<Either<Exception, List<ThoughtEntity>>> getAll() async {
    try {
      final result = await _externalThoughtDatasource.getAll();

      return Right(ThoughtEntity.fromList(result));
    } catch (e) {
      return Left(
        Exception('DataThoughtRepository: getAll Exception'),
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
        Exception('DataThoughtRepository: getComments Exception'),
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
        Exception('DataThoughtRepository: getUser Exception'),
      );
    }
  }

  @override
  Future<Either<Exception, List<ThoughtEntity>>> searchByTitle(
    String title,
  ) async {
    try {
      final result = await _externalThoughtDatasource.getAll();

      return Right(ThoughtEntity.fromListWithFilter(title, result));
    } catch (e) {
      return Left(
        Exception('DataThoughtRepository: searchByTitle Exception'),
      );
    }
  }
}
