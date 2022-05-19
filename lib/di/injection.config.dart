// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../config/flavor_config.dart' as _i4;
import '../data/network/rest_client.dart' as _i5;
import '../data/network/service/comments_service.dart' as _i6;
import 'register_module.dart' as _i7;

const String _development = 'development';
const String _stage = 'stage';
const String _production = 'production';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.Dio>(registerModule.dio);
  gh.singleton<_i4.FlavorConfig>(_i4.DevConfig(), registerFor: {_development});
  gh.singleton<_i4.FlavorConfig>(_i4.StageConfig(), registerFor: {_stage});
  gh.singleton<_i4.FlavorConfig>(_i4.ProdConfig(), registerFor: {_production});
  gh.singleton<_i5.RestClient>(
      _i5.RestClient.create(get<_i3.Dio>(), get<_i4.FlavorConfig>()));
  gh.singleton<_i6.CommentsService>(_i6.CommentsService(get<_i5.RestClient>()));
  return get;
}

class _$RegisterModule extends _i7.RegisterModule {}
