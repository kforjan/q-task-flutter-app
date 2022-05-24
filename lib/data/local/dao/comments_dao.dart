import 'package:floor/floor.dart';
import 'package:q_task_flutter_app/common/constants/constants.dart';
import 'package:q_task_flutter_app/data/model/domain/comment.dart';

import '../../../common/base/base_dao.dart';

@dao
abstract class CommentDao extends BaseDao<Comment> {
  @Query('SELECT * FROM ${Constants.tableComment}')
  Stream<List<Comment>> getCommentsStream();

  @Query('SELECT * FROM ${Constants.tableComment}')
  Future<List<Comment>> getCommentsAsync();

  @Query('DELETE FROM ${Constants.tableComment}')
  Future<void> deleteAllComments();
}
