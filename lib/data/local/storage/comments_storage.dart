import 'package:injectable/injectable.dart';
import 'package:q_task_flutter_app/data/local/db.dart';
import 'package:q_task_flutter_app/data/model/domain/comment.dart';

@singleton
class CommentsStorage {
  final Db _db;

  CommentsStorage(this._db);

  Future<void> saveComments(List<Comment> comments) async {
    await _db.commentsDao.insertMultiple(comments);
  }

  Future<void> deleteAllComments() async {
    return await _db.commentsDao.deleteAllComments();
  }

  Future<List<Comment>> getCommentsAsync() async {
    return await _db.commentsDao.getCommentsAsync();
  }

  Stream<List<Comment>> getCommentsStream() {
    return _db.commentsDao.getCommentsStream();
  }
}
