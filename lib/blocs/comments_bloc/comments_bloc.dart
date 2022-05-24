import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:q_task_flutter_app/common/constants/constants.dart';
import 'package:q_task_flutter_app/data/model/domain/comment.dart';
import 'package:q_task_flutter_app/repositories/comments_repository.dart';
import 'dart:async';

part 'comments_event.dart';
part 'comments_state.dart';

@lazySingleton
class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  final CommentsRepository _commentsRepository;

  CommentsBloc(this._commentsRepository) : super(const CommentsInitial()) {
    on<CommentsFetch>(_onCommentsFetch);
    on<CommentsRefresh>(_onCommentsRefresh);
  }

  FutureOr<void> _onCommentsFetch(
      CommentsFetch event, Emitter<CommentsState> emit) async {
    final state = this.state;
    try {
      List<Comment> allComments;
      List<Comment> newComments;
      int pageNumber;

      if (state is CommentsLoaded) {
        pageNumber = state.pageNumber + 1;
        allComments = state.allComments;
        emit(const CommentsLoading());
        newComments = await _commentsRepository.getComments(
          page: pageNumber,
          limit: Constants.pageSize,
        );
        allComments.addAll(newComments);
      } else {
        pageNumber = state.pageNumber + 1;
        emit(CommentsLoading(pageNumber: state.pageNumber));
        allComments = await _commentsRepository.getComments(
          page: pageNumber,
          limit: Constants.pageSize,
        );
        newComments = allComments;
      }
      emit(CommentsLoaded(
        allComments: allComments,
        newComments: newComments,
        pageNumber: pageNumber,
      ));
    } catch (error) {
      if (error is Exception) {
        emit(CommentsError(
          error: error,
          pageNumber: state.pageNumber,
        ));
      }
    }
  }

  FutureOr<void> _onCommentsRefresh(
      CommentsRefresh event, Emitter<CommentsState> emit) async {
    emit(const CommentsInitial());
  }
}
