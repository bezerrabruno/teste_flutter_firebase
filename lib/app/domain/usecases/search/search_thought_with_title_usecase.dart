import 'package:dartz/dartz.dart';
import 'package:teste_flutter_firebase/app/domain/entities/thought_entity.dart';
import 'package:teste_flutter_firebase/app/domain/interfaces/thought/thought_repository.dart';

class SearchThoughtWithTitleUsecase {
  final ThoughtRepository _thoughtRepository;

  const SearchThoughtWithTitleUsecase(
    this._thoughtRepository,
  );

  Future<Either<Exception, List<ThoughtEntity>>> call({
    required String title,
  }) async {
    return await _thoughtRepository.searchByTitle(title);
  }
}
