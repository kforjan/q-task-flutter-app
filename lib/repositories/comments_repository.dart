import 'package:injectable/injectable.dart';
import 'package:q_task_flutter_app/data/model/domain/comment.dart';
import 'package:q_task_flutter_app/data/network/service/comments_service.dart';

@singleton
class CommentsRepository {
  CommentsRepository(this._commentService);

  final CommentsService _commentService;

  Future<List<Comment>> getComments({
    required int start,
    required int limit,
  }) async {
    return await _commentService.getComments(
      start,
      limit,
    );
  }
}
