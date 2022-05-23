import 'package:floor/floor.dart';
import 'package:q_task_flutter_app/common/constants/strings.dart';
import 'package:q_task_flutter_app/data/model/domain/comment.dart';

import '../../../common/base/base_dao.dart';

@dao
abstract class CommentDao extends BaseDao<Comment> {
  @Query('SELECT * FROM ${Strings.tableComment}')
  Stream<List<Comment>> getCommentsStream();

  @Query('SELECT * FROM ${Strings.tableComment}')
  Future<List<Comment>> getCommentsAsync();

  @Query('DELETE FROM ${Strings.tableComment}')
  Future<void> deleteAllComments();
}
