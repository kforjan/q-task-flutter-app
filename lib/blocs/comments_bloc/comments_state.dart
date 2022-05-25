part of 'comments_bloc.dart';

abstract class CommentsState extends Equatable {
  const CommentsState({this.pageNumber = 0});

  final int pageNumber;

  @override
  List<Object> get props => [pageNumber];
}

class CommentsInitial extends CommentsState {
  const CommentsInitial() : super(pageNumber: 0);

  @override
  List<Object> get props => [pageNumber];
}

class CommentsLoading extends CommentsState {
  const CommentsLoading({int pageNumber = 0}) : super(pageNumber: pageNumber);

  @override
  List<Object> get props => [pageNumber];
}

class CommentsLoaded extends CommentsState {
  const CommentsLoaded(
      {required this.allComments,
      required this.newComments,
      required pageNumber})
      : super(pageNumber: pageNumber);
  final List<Comment> allComments;
  final List<Comment> newComments;

  @override
  List<Object> get props => [allComments, newComments, pageNumber];
}

class CommentsError extends CommentsState {
  const CommentsError({
    required this.error,
    required pageNumber,
  }) : super(pageNumber: pageNumber);
  final Exception error;

  @override
  List<Object> get props => [error, pageNumber];
}
