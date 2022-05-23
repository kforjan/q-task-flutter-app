import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:q_task_flutter_app/data/model/domain/comment.dart';
import 'package:q_task_flutter_app/repositories/comments_repository.dart';
import 'dart:async';

part 'comments_event.dart';
part 'comments_state.dart';

@lazySingleton
class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  final CommentsRepository _commentsRepository;

  CommentsBloc(this._commentsRepository) : super(CommentsInitial()) {
    on<CommentsFetch>(_onCommentsFetch);
  }

  FutureOr<void> _onCommentsFetch(
      CommentsFetch event, Emitter<CommentsState> emit) async {
    emit(CommentsLoading());
    try {
      final state = this.state;
      final List<Comment> comments;
      if (state is CommentsLoaded) {
        comments = await _commentsRepository.getComments(
          start: state.comments.length,
          limit: 10,
        );
      } else {
        comments = await _commentsRepository.getComments(
          start: 1,
          limit: 10,
        );
      }
      emit(CommentsLoaded(comments: comments));
    } catch (error) {
      if (error is Exception) {
        emit(CommentsError(error: error));
      }
    }
  }
}
