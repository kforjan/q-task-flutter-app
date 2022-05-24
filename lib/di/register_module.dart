import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:q_task_flutter_app/common/constants/constants.dart';
import 'package:q_task_flutter_app/data/local/db.dart';

@module
abstract class RegisterModule {
  @singleton
  Dio get dio => Dio();

  @preResolve
  @singleton
  Future<Db> get database => $FloorDb.databaseBuilder(Constants.dbName).build();
}
