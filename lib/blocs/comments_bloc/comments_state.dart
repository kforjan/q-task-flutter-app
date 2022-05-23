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
  const CommentsLoaded({required this.comments});
  final List<Comment> comments;

  @override
  List<Object> get props => [comments];
}

class CommentsError extends CommentsState {
  const CommentsError({required this.error});

  final Exception error;

  @override
  List<Object> get props => [error];
}
