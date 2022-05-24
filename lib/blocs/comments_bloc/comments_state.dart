part of 'comments_bloc.dart';

abstract class CommentsState extends Equatable {
  const CommentsState();

  @override
  List<Object> get props => [];
}

class CommentsInitial extends CommentsState {}

class CommentsLoading extends CommentsState {
  @override
  List<Object> get props => [];
}

class CommentsLoaded extends CommentsState {
  const CommentsLoaded(
      {required this.allComments,
      required this.newComments,
      required this.pageNumber});
  final List<Comment> allComments;
  final List<Comment> newComments;
  final int pageNumber;

  @override
  List<Object> get props => [allComments, newComments];
}

class CommentsError extends CommentsState {
  const CommentsError({required this.error});

  final Exception error;

  @override
  List<Object> get props => [error];
}
