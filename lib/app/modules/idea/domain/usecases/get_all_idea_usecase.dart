import 'package:dartz/dartz.dart';
import 'package:teste_flutter_firebase/app/core/entities/idea_entity.dart';
import 'package:teste_flutter_firebase/app/modules/idea/domain/interfaces/idea_repository.dart';

class GetAllIdedaUsecase {
  final IdeaRepository _ideaRepository;

  const GetAllIdedaUsecase(
    this._ideaRepository,
  );

  Future<Either<Exception, List<IdeaEntity>>> call() async {
    return await _ideaRepository.getAll();
  }
}
