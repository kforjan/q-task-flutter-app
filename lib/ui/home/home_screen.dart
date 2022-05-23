import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_task_flutter_app/blocs/comments_bloc/comments_bloc.dart';
import 'package:q_task_flutter_app/di/injection.dart';
import 'package:q_task_flutter_app/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).appName),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<CommentsBloc, CommentsState>(
              builder: (context, state) {
                if (state is CommentsLoaded) {
                  return ListView.builder(
                    itemCount: state.comments.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(state.comments[index].body),
                    ),
                  );
                } else if (state is CommentsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return (const Text('Waiting.'));
                }
              },
            ),
          ),
          ElevatedButton(
            onPressed: () => sl<CommentsBloc>()..add(const CommentsFetch()),
            child: const Text('Fetch'),
          )
        ],
      ),
    );
  }
}
