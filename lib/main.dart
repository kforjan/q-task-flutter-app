import 'package:flutter/material.dart';
import 'package:q_task_flutter_app/di/injection.dart';
import 'package:q_task_flutter_app/util/config_reader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigReader.initialize();
  configureDependencies(ConfigReader.getEvnironment());
  runApp(const QApp());
}

class QApp extends StatelessWidget {
  const QApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Q App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Q App'),
        ),
        body: Container(),
      ),
    );
  }
}
