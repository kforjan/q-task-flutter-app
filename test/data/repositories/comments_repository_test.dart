import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:q_task_flutter_app/data/local/storage/comments_storage.dart';
import 'package:q_task_flutter_app/data/model/domain/comment.dart';
import 'package:q_task_flutter_app/data/network/service/comments_service.dart';
import 'package:q_task_flutter_app/data/repositories/comments_repository.dart';

class MockCommentsService extends Mock implements CommentsService {}

class MockCommentsStorage extends Mock implements CommentsStorage {}

void main() {
  late CommentsRepository sut;
  late MockCommentsService mockCommentsService;
  late MockCommentsStorage mockCommentsStorage;

  setUp(() {
    mockCommentsService = MockCommentsService();
    mockCommentsStorage = MockCommentsStorage();
    sut = CommentsRepository(
      mockCommentsService,
      mockCommentsStorage,
    );
  });

  final List<Comment> comments = [
    Comment(
        postId: 1,
        id: 1,
        name: 'Test1',
        email: 'test1@test.com',
        body: 'Test1'),
    Comment(
        postId: 1,
        id: 2,
        name: 'Test2',
        email: 'test2@test.com',
        body: 'Test2'),
    Comment(
        postId: 1,
        id: 3,
        name: 'Test3',
        email: 'test3@test.com',
        body: 'Test3'),
    Comment(
        postId: 1,
        id: 4,
        name: 'Test4',
        email: 'test4@test.com',
        body: 'Test4'),
    Comment(
        postId: 1,
        id: 5,
        name: 'Test5',
        email: 'test5@test.com',
        body: 'Test5'),
  ];

  group('getComments', () {
    test(
      'should return network data when the call to the network data source is successful',
      () async {
        // arrange
        when(() => mockCommentsService.getComments(
              page: 1,
              limit: 5,
            )).thenAnswer((_) async => comments);
        when(() => mockCommentsStorage.getCommentsAsync())
            .thenAnswer((_) async => comments);
        when(() => mockCommentsStorage.saveComments(comments))
            .thenAnswer((_) async => Future.value());
        // act
        final result = await sut.getComments(
          page: 1,
          limit: 5,
        );
        // assert
        verify(() => mockCommentsService.getComments(
              page: 1,
              limit: 5,
            )).called(1);
        expect(result, comments);
      },
    );

    test(
      'should cache the data locally when the call to the network data source is successful',
      () async {
        // arrange
        when(() => mockCommentsService.getComments(
              page: 1,
              limit: 5,
            )).thenAnswer((_) async => comments);
        when(() => mockCommentsStorage.getCommentsAsync())
            .thenAnswer((_) async => comments);
        when(() => mockCommentsStorage.saveComments(comments))
            .thenAnswer((_) async => Future.value());
        // act
        await sut.getComments(
          page: 1,
          limit: 5,
        );
        // assert
        verify(() => mockCommentsService.getComments(
              page: 1,
              limit: 5,
            )).called(1);
        verify(() => mockCommentsStorage.saveComments(comments)).called(1);
      },
    );

    test(
      'should return last locally cached data when offline',
      () async {
        // arrange
        when(() => mockCommentsStorage.getCommentsAsync())
            .thenAnswer((_) async => comments);
        // act
        final result = await sut.getPersistCommentsAsync();
        // assert
        verifyZeroInteractions(mockCommentsService);
        verify(() => mockCommentsStorage.getCommentsAsync()).called(1);
        expect(result, equals(comments));
      },
    );
  });
}
