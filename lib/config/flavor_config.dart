import 'package:injectable/injectable.dart';
import 'package:q_task_flutter_app/common/constants/constants.dart';

abstract class Env {
  static const development = 'development';
  static const stage = 'stage';
  static const production = 'production';
}

enum Flavor { dev, stage, prod }

abstract class FlavorConfig {
  Flavor getFlavor();

  String getBaseApiUrl();
}

@Singleton(as: FlavorConfig, env: [Env.development])
class DevConfig implements FlavorConfig {
  @override
  Flavor getFlavor() => Flavor.dev;

  @override
  String getBaseApiUrl() => Strings.devBaseUrl;
}

@Singleton(as: FlavorConfig, env: [Env.stage])
class StageConfig implements FlavorConfig {
  @override
  Flavor getFlavor() => Flavor.stage;

  @override
  String getBaseApiUrl() => Strings.stageBaseUrl;
}

@Singleton(as: FlavorConfig, env: [Env.production])
class ProdConfig implements FlavorConfig {
  @override
  Flavor getFlavor() => Flavor.prod;

  @override
  String getBaseApiUrl() => Strings.prodBaseUrl;
}
