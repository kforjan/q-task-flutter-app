import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:q_task_flutter_app/config/flavor_config.dart';
import 'package:q_task_flutter_app/data/model/response/comments_response.dart';
import 'package:retrofit/retrofit.dart';

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

    return RestClient(dio);
  }

  @GET("/mobile/customer/transaction-list")
  Future<CommentsResponse> getComments({
    @Query("_start") required int start,
    @Query("_limit") required int limit,
  });
}