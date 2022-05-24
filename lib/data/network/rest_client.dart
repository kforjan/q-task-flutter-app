import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:q_task_flutter_app/config/flavor_config.dart';
import 'package:q_task_flutter_app/data/model/domain/comment.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio_logger/dio_logger.dart';

part 'rest_client.g.dart';

@singleton
@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @factoryMethod
  static RestClient create(
    Dio dio,
    FlavorConfig flavorConfig,
  ) {
    dio.options = BaseOptions(
      baseUrl: flavorConfig.getBaseApiUrl(),
      connectTimeout: 5000,
      receiveTimeout: 5000,
      sendTimeout: 5000,
    );

    dio.interceptors.add(dioLoggerInterceptor);

    return RestClient(dio);
  }

  @GET('comments')
  Future<List<Comment>> getComments({
    @Query('_page') required int page,
    @Query('_limit') required int limit,
  });
}
