import 'package:injectable/injectable.dart';

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
  String getBaseApiUrl() => 'https://jsonplaceholder.typicode.com/';
}

@Singleton(as: FlavorConfig, env: [Env.stage])
class StageConfig implements FlavorConfig {
  @override
  Flavor getFlavor() => Flavor.stage;

  @override
  String getBaseApiUrl() => 'https://jsonplaceholder.typicode.com/';
}

@Singleton(as: FlavorConfig, env: [Env.production])
class ProdConfig implements FlavorConfig {
  @override
  Flavor getFlavor() => Flavor.prod;

  @override
  String getBaseApiUrl() => 'https://jsonplaceholder.typicode.com/';
}
