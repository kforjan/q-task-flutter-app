part of 'comments_bloc.dart';

abstract class CommentsEvent extends Equatable {
  const CommentsEvent();

  @override
  List<Object> get props => [];
}

class CommentsFetch extends CommentsEvent {
  @override
  List<Object> get props => [];
}

class CommentsRefresh extends CommentsEvent {
  @override
  List<Object> get props => [];
}
