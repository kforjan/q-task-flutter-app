// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../config/flavor_config.dart' as _i6;
import '../data/local/db.dart' as _i4;
import '../data/local/storage/comments_storage.dart' as _i3;
import '../data/network/rest_client.dart' as _i7;
import '../data/network/service/comments_service.dart' as _i8;
import '../repositories/comments_repository.dart' as _i9;
import 'register_module.dart' as _i10;

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
  gh.singleton<_i3.CommentStorage>(_i3.CommentStorage(get<_i4.Db>()));
  gh.singleton<_i5.Dio>(registerModule.dio);
  gh.singleton<_i6.FlavorConfig>(_i6.DevConfig(), registerFor: {_development});
  gh.singleton<_i6.FlavorConfig>(_i6.StageConfig(), registerFor: {_stage});
  gh.singleton<_i6.FlavorConfig>(_i6.ProdConfig(), registerFor: {_production});
  gh.singleton<_i7.RestClient>(
      _i7.RestClient.create(get<_i5.Dio>(), get<_i6.FlavorConfig>()));
  gh.singleton<_i8.CommentsService>(_i8.CommentsService(get<_i7.RestClient>()));
  gh.singleton<_i9.CommentsRepository>(_i9.CommentsRepository(
      get<_i8.CommentsService>(), get<_i3.CommentStorage>()));
  return get;
}

class _$RegisterModule extends _i10.RegisterModule {}
