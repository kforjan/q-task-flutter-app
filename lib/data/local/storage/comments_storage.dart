import 'package:injectable/injectable.dart';
import 'package:q_task_flutter_app/data/local/db.dart';
import 'package:q_task_flutter_app/data/model/domain/comment.dart';

@singleton
class CommentStorage {
  final Db _db;

  CommentStorage(this._db);

  Future<void> saveComments(List<Comment> comments) async {
    await _db.commentsDao.insertMultiple(comments);
  }

  Stream<List<Comment>> getCommentsStream() {
    return _db.commentsDao.getCommentsStream();
  }

  Future<void> deleteAllComments() async {
    return await _db.commentsDao.deleteAllComments();
  }

  Future<List<Comment>> getCommentsAsync() async {
    return await _db.commentsDao.getCommentsAsync();
  }
}
