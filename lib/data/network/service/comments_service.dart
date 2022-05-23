// ignore_for_file: unused_field

import 'package:injectable/injectable.dart';
import 'package:q_task_flutter_app/data/model/domain/comment.dart';
import 'package:q_task_flutter_app/util/error_handler.dart';

import '../../../common/base/base_service.dart';

import '../rest_client.dart';

@singleton
class CommentsService extends BaseService {
  final RestClient _restClient;

  CommentsService(this._restClient);

  Future<List<Comment>> getComments(int start, int limit) async {
    return await apiRequest(
      apiCall: _restClient.getComments(
        start: start,
        limit: limit,
      ),

      errorResolver: DefaultErrorResolver(), //TODO: error resolver
    );
  }
}
