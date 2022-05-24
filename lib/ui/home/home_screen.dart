import 'package:flutter/material.dart';
import 'package:q_task_flutter_app/generated/l10n.dart';
import 'package:q_task_flutter_app/ui/home/widgets/comments_paged_listview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).appName),
      ),
      body: Column(
        children: const [
          Expanded(
            child: CommentsPagedListview(),
          ),
        ],
      ),
    );
  }
}
