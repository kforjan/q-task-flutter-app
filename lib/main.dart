import 'package:flutter/material.dart';
import 'package:q_task_flutter_app/di/injection.dart';
import 'package:q_task_flutter_app/util/config_reader.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigReader.initialize();
  configureDependencies(ConfigReader.getEvnironment());
  runApp(const QApp());
}
