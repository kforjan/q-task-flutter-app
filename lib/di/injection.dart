import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';

final sl = GetIt.instance;

@injectableInit
void configureDependencies(String environment) {
  $initGetIt(sl, environment: environment);
}
