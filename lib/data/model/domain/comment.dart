// ignore_for_file: non_constant_identifier_names

import 'package:floor/floor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.g.dart';

@JsonSerializable()
@entity
class Comment {
  @primaryKey
  final int id;
  final int postId;
  final String name;
  final String email;
  final String body;

  Comment({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
