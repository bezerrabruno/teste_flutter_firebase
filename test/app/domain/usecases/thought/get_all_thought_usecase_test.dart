import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_flutter_firebase/app/domain/entities/thought_entity.dart';
import 'package:teste_flutter_firebase/app/domain/interfaces/thought/thought_repository.dart';
import 'package:teste_flutter_firebase/app/domain/usecases/thought/get_all_thought_usecase.dart';

class MockThoughtRepository extends Mock implements ThoughtRepository {}

void main() {
  group('GetAllThoughtUsecase', () {
    late MockThoughtRepository mockThoughtRepository;
    late GetAllThoughtUsecase getAllThoughtUsecase;

    setUp(() {
      mockThoughtRepository = MockThoughtRepository();
      getAllThoughtUsecase = GetAllThoughtUsecase(mockThoughtRepository);
    });

    test('Deve retornar sucesso ao chamar o Usecase', () async {
      final thoughts = [
        ThoughtEntity(
          id: 1,
          userId: 1,
          title: 'title',
          body: 'body.',
        ),
        ThoughtEntity(
          id: 2,
          userId: 2,
          title: 'title',
          body: 'body.',
        ),
      ];

      when(() => mockThoughtRepository.getAll())
          .thenAnswer((_) async => Right(thoughts));

      final result = await getAllThoughtUsecase();

      expect(result, isA<Right<Exception, List<ThoughtEntity>>>());
    });
  });
}
