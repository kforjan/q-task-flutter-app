import 'package:injectable/injectable.dart';
import 'package:q_task_flutter_app/common/constants/constants.dart';
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
    required int page,
    required int limit,
  }) async {
    final comments = await _commentsService.getComments(
      page,
      limit,
    );
    final List<Comment> currentPeristedComments =
        await getPersistCommentsAsync() ?? [];
    if (currentPeristedComments.length < Constants.dbCommentsLimit) {
      await _commentsStorage.saveComments(comments);
    }
    return comments;
  }

  Future<List<Comment>?> getPersistCommentsAsync() async {
    return await _commentsStorage.getCommentsAsync();
  }
}
