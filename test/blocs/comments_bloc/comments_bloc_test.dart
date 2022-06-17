import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:q_task_flutter_app/blocs/comments_bloc/comments_bloc.dart';
import 'package:q_task_flutter_app/data/model/domain/comment.dart';
import 'package:q_task_flutter_app/data/repositories/comments_repository.dart';

class MockCommentsRepository extends Mock implements CommentsRepository {}

void main() {
  late CommentsBloc sut;
  late MockCommentsRepository mockCommentsRepository;

  setUp(() {
    mockCommentsRepository = MockCommentsRepository();
    sut = CommentsBloc(mockCommentsRepository);
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

  group('onCommentsFetch', () {
    blocTest(
      'emits CommentsLoaded on CommentsFetch',
      setUp: () {
        when(() => mockCommentsRepository.getComments(
              page: 1,
              limit: 15,
            )).thenAnswer((_) async => comments);
      },
      build: () => sut,
      act: (CommentsBloc bloc) => bloc.add(CommentsFetch()),
      expect: () => [
        const CommentsLoading(),
        CommentsLoaded(
          newComments: comments,
          allComments: comments,
          pageNumber: 1,
        )
      ],
    );
  });

  group('onCommentsRefresh', () {
    blocTest(
      'emits CommentsInitial on CommentsRefresh',
      build: () => sut,
      act: (CommentsBloc bloc) => bloc.add(CommentsRefresh()),
      expect: () => [const CommentsInitial()],
    );
  });
}
