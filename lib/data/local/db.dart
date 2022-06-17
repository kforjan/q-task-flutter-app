import 'dart:async';
import 'package:floor/floor.dart';
import 'package:q_task_flutter_app/common/constants/constants.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:q_task_flutter_app/data/local/dao/comments_dao.dart';

import 'package:q_task_flutter_app/data/model/domain/comment.dart';

part 'db.g.dart';

@Database(version: Constants.dbVersion, entities: [Comment])
abstract class Db extends FloorDatabase {
  CommentsDao get commentsDao;
}
