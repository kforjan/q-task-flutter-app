import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:q_task_flutter_app/blocs/comments_bloc/comments_bloc.dart';
import 'package:q_task_flutter_app/data/model/domain/comment.dart';
import 'package:q_task_flutter_app/generated/l10n.dart';
import 'package:q_task_flutter_app/ui/home/widgets/comment_platform_dialog.dart';

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
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _commentsBloc.add(CommentsFetch());
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
    return Material(
      child: BlocListener<CommentsBloc, CommentsState>(
        bloc: _commentsBloc,
        listenWhen: (previous, current) {
          return previous is CommentsLoading || current is CommentsLoading;
        },
        listener: (context, state) {
          if (state is CommentsLoaded) {
            final isLastPage = state.newComments.isEmpty;
            if (isLastPage) {
              _pagingController.appendLastPage(state.newComments);
            } else {
              _pagingController.appendPage(state.newComments, state.pageNumber);
            }

            _refreshController.refreshCompleted();
          } else if (state is CommentsError) {
            _pagingController.error = state.error;

            _refreshController.refreshFailed();
          }
        },
        child: Scrollbar(
          child: SmartRefresher(
            controller: _refreshController,
            onRefresh: () {
              _commentsBloc.add(CommentsRefresh());
              _pagingController.refresh();
            },
            child: PagedListView<int, Comment>.separated(
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<Comment>(
                itemBuilder: ((context, comment, index) {
                  return InkWell(
                    onTap: () => _showCommentPlatformDialog(comment),
                    child: ListTile(
                      leading: Text(comment.id.toString()),
                      title: Text('${comment.email}\n${comment.name}'),
                      subtitle: Text(comment.body),
                    ),
                  );
                }),
                firstPageProgressIndicatorBuilder: (context) => Container(),
                noItemsFoundIndicatorBuilder: (context) =>
                    PlatformText(S.of(context).no_comments_yet),
                newPageProgressIndicatorBuilder: (context) =>
                    Center(child: PlatformCircularProgressIndicator()),
              ),
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(height: 1.0),
            ),
          ),
        ),
      ),
    );
  }

  _showCommentPlatformDialog(Comment comment) => showDialog(
        context: context,
        builder: (context) => CommentPlatformDialog(
          title: comment.name,
          content: comment.body,
        ),
      );
}
