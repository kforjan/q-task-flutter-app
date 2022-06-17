import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:q_task_flutter_app/data/local/dao/comments_dao.dart';
import 'package:q_task_flutter_app/data/local/db.dart';
import 'package:q_task_flutter_app/data/local/storage/comments_storage.dart';
import 'package:q_task_flutter_app/data/model/domain/comment.dart';

class MockDb extends Mock implements Db {}

class MockCommentsDao extends Mock implements CommentsDao {}

void main() {
  late CommentsStorage sut;
  late MockDb mockDb;
  late MockCommentsDao mockCommentsDao;

  setUp(() {
    mockDb = MockDb();
    mockCommentsDao = MockCommentsDao();
    sut = CommentsStorage(mockDb);
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

  group('getCommentsAsync', () {
    test(
      'should return local data from the storage',
      () async {
        // arrange
        when(() => mockDb.commentsDao).thenReturn(mockCommentsDao);
        when(() => mockCommentsDao.getCommentsAsync())
            .thenAnswer((_) async => comments);
        // act
        final result = await sut.getCommentsAsync();
        // assert
        verify(() => mockDb.commentsDao.getCommentsAsync()).called(1);
        expect(result, equals(comments));
      },
    );
  });

  group('saveComments', () {
    test(
      'should call db insertMultiple to store comments localy',
      () async {
        when(() => mockDb.commentsDao).thenReturn(mockCommentsDao);
        when(() => mockCommentsDao.insertMultiple(comments))
            .thenAnswer((_) async => Future.value());
        // act
        await sut.saveComments(comments);
        // assert
        verify(() => mockDb.commentsDao.insertMultiple(comments)).called(1);
      },
    );
  });

  group('deleteAllComments', () {
    test(
      'should call db deleteAllComments and delete all stored data',
      () async {
        when(() => mockDb.commentsDao).thenReturn(mockCommentsDao);
        when(() => mockCommentsDao.deleteAllComments())
            .thenAnswer((_) async => Future.value());
        // act
        await sut.deleteAllComments();
        // assert
        verify(() => mockDb.commentsDao.deleteAllComments()).called(1);
      },
    );
  });
}
