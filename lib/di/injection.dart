import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';

final sl = GetIt.instance;

@injectableInit
Future<void> configureDependencies(String environment) async {
  await $initGetIt(sl, environment: environment);
}
