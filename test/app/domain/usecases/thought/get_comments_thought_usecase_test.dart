import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_flutter_firebase/app/domain/entities/comment_entity.dart';
import 'package:teste_flutter_firebase/app/domain/interfaces/thought/thought_repository.dart';
import 'package:teste_flutter_firebase/app/domain/usecases/thought/get_comments_thought_usecase.dart';

class MockThoughtRepository extends Mock implements ThoughtRepository {}

void main() {
  group('GetAllThoughtUsecase', () {
    late MockThoughtRepository mockThoughtRepository;
    late GetCommentsThoughtUsecase getCommentsThoughtUsecase;

    setUp(() {
      mockThoughtRepository = MockThoughtRepository();
      getCommentsThoughtUsecase =
          GetCommentsThoughtUsecase(mockThoughtRepository);
    });

    test('Deve retornar sucesso ao chamar o Usecase', () async {
      final comments = [
        CommentEntity(
          id: 1,
          name: 'name',
          body: 'body.',
        ),
        CommentEntity(
          id: 2,
          name: 'name',
          body: 'body.',
        ),
      ];

      when(() => mockThoughtRepository.getComments(1))
          .thenAnswer((_) async => Right(comments));

      final result = await getCommentsThoughtUsecase(postId: 1);

      expect(result, isA<Right<Exception, List<CommentEntity>>>());
    });
  });
}
