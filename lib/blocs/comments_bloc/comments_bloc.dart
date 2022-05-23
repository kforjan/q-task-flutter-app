import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:q_task_flutter_app/data/model/domain/comment.dart';
import 'package:q_task_flutter_app/repositories/comments_repository.dart';

part 'comments_event.dart';
part 'comments_state.dart';

@injectable
class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  final CommentsRepository _commentsRepository;

  CommentsBloc(this._commentsRepository) : super(CommentsInitial()) {
    on<CommentsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
