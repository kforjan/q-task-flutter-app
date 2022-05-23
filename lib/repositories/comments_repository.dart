import 'package:injectable/injectable.dart';
import 'package:q_task_flutter_app/data/local/storage/comments_storage.dart';
import 'package:q_task_flutter_app/data/model/domain/comment.dart';
import 'package:q_task_flutter_app/data/network/service/comments_service.dart';

@singleton
class CommentsRepository {
  CommentsRepository(
    this._commentsService,
    this._commentsStorage,
  );

  final CommentsService _commentsService;
  final CommentStorage _commentsStorage;

  Future<List<Comment>> getComments({
    required int start,
    required int limit,
  }) async {
    final commentsResponse = await _commentsService.getComments(
      start,
      limit,
    );
    await _commentsStorage
        .saveComments(commentsResponse.comments ?? <Comment>[]);

    return commentsResponse.comments ?? <Comment>[];
  }

  Future<List<Comment>?> getPersistCommentsAsync() async {
    return await _commentsStorage.getCommentsAsync();
  }
}
