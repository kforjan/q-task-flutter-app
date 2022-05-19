import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:q_task_flutter_app/data/model/domain/comment.dart';

part 'comments_response.freezed.dart';

part 'comments_response.g.dart';

@freezed
class CommentsResponse with _$CommentsResponse {
  factory CommentsResponse({
    @Default(null) List<Comment>? comments,
  }) = _CommentsResponse;

  factory CommentsResponse.fromJson(Map<String, dynamic> json) =>
      _$CommentsResponseFromJson(json);
}
