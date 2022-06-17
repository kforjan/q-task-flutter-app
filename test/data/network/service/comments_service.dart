import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:q_task_flutter_app/data/model/domain/comment.dart';
import 'package:q_task_flutter_app/data/network/rest_client.dart';
import 'package:q_task_flutter_app/data/network/service/comments_service.dart';

class MockRestClient extends Mock implements RestClient {}

void main() {
  late CommentsService sut;
  late MockRestClient mockRestClient;

  setUp(() {
    mockRestClient = MockRestClient();
    sut = CommentsService(mockRestClient);
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
      'should return local data from the storage',
      () async {
        // arrange
        when(() => mockRestClient.getComments(page: 1, limit: 5))
            .thenAnswer((_) async => comments);
        // act
        final result = await sut.getComments(
          page: 1,
          limit: 5,
        );
        // assert
        verify(() => mockRestClient.getComments(
              page: 1,
              limit: 5,
            )).called(1);
        expect(result, equals(comments));
      },
    );
  });
}
