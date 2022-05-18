import 'package:q_task_flutter_app/util/error_handler.dart';

abstract class BaseService {
  Future<T> apiRequest<T>({
    required apiCall,
    ErrorResolver? errorResolver,
  }) async {
    try {
      return await apiCall;
    } catch (error) {
      throw ErrorHandler.resolveNetworkError(
        error: error,
        customErrorResolver: errorResolver,
      );
    }
  }
}
