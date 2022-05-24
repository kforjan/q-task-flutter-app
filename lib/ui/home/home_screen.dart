import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:q_task_flutter_app/generated/l10n.dart';
import 'package:q_task_flutter_app/ui/home/widgets/comments_paged_listview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: PlatformText(S.of(context).app_name),
      ),
      body: SafeArea(
        child: Column(
          children: const [
            Expanded(
              child: CommentsPagedListview(),
            ),
          ],
        ),
      ),
    );
  }
}
