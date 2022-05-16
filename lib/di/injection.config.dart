// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../config/flavor_config.dart' as _i3;

const String _development = 'development';
const String _stage = 'stage';
const String _production = 'production';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.FlavorConfig>(_i3.DevConfig(), registerFor: {_development});
  gh.singleton<_i3.FlavorConfig>(_i3.StageConfig(), registerFor: {_stage});
  gh.singleton<_i3.FlavorConfig>(_i3.ProdConfig(), registerFor: {_production});
  return get;
}
