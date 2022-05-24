import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class CommentPlatformDialog extends StatelessWidget {
  const CommentPlatformDialog({
    this.title = '',
    this.content = '',
    Key? key,
  }) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return PlatformAlertDialog(
      title: Text(title),
      content: Text(content),
    );
  }
}
