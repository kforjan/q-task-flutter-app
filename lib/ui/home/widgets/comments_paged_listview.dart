import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:q_task_flutter_app/blocs/comments_bloc/comments_bloc.dart';
import 'package:q_task_flutter_app/data/model/domain/comment.dart';

import '../../../di/injection.dart';

class CommentsPagedListview extends StatefulWidget {
  const CommentsPagedListview({Key? key}) : super(key: key);

  @override
  State<CommentsPagedListview> createState() => _CommentsPagedListviewState();
}

class _CommentsPagedListviewState extends State<CommentsPagedListview> {
  late final _commentsBloc = sl<CommentsBloc>();

  final PagingController<int, Comment> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      print('SAD------------------------!!!!!!');
      print(_pagingController.nextPageKey);
      _commentsBloc.add(
        CommentsFetch(),
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pagingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CommentsBloc, CommentsState>(
      bloc: _commentsBloc,
      listenWhen: (previous, current) {
        return previous is CommentsLoading || current is CommentsLoading;
      },
      listener: (context, state) {
        if (state is CommentsLoading) {
        } else {
          if (state is CommentsLoaded) {
            final isLastPage = state.newComments.isEmpty;
            if (isLastPage) {
              _pagingController.appendLastPage(state.newComments);
            } else {
              _pagingController.appendPage(state.newComments, state.pageNumber);
            }
          } else if (state is CommentsError) {
            _pagingController.error = state.error;
          }
        }
      },
      child: RefreshIndicator(
        onRefresh: () => Future.sync(
          () {
            _pagingController.refresh();
          },
        ),
        child: PagedListView<int, Comment>.separated(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<Comment>(
            noItemsFoundIndicatorBuilder: (context) =>
                const Text('no comments'),
            itemBuilder: ((context, comment, index) {
              return ListTile(
                title: Text(comment.id.toString()),
              );
            }),
          ),
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(height: 1.0),
        ),
      ),
    );
  }
}
