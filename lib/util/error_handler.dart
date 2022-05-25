import 'package:dio/dio.dart';
import 'package:q_task_flutter_app/generated/l10n.dart';

// error handler
class ErrorHandler {
  static Exception resolveNetworkError<T>(
      {required dynamic error, ErrorResolver? customErrorResolver}) {
    final ErrorResolver errorResolver =
        customErrorResolver ?? DefaultErrorResolver();
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.cancel:
          return CancelError(error.message);
        case DioErrorType.connectTimeout:
          return ConnectTimeoutError(error.message);
        case DioErrorType.sendTimeout:
          return SendTimeoutError(error.message);
        case DioErrorType.receiveTimeout:
          return ReceiveTimeoutError(error.message);
        case DioErrorType.other:
          return error.error;
        case DioErrorType.response:
          return errorResolver.resolve(
            error.response!,
          );
        default:
          return Exception(error.message);
      }
    }
    return Exception(error.toString());
  }

  static String resolveExceptionMessage(Exception error) {
    switch (error.runtimeType) {
      case ServerError:
        return S.current.server_error;
      default:
        return S.current.unknown_error;
    }
  }
}

// error resolvers
abstract class ErrorResolver {
  Exception resolve<T>(dynamic response);
}

class DefaultErrorResolver implements ErrorResolver {
  @override
  Exception resolve<T>(response) {
    final int? statusCode = response.statusCode;
    final String statusMessage = response.statusMessage ?? '';
    if (statusCode != null) {
      if (statusCode >= 500 && statusCode <= 599) {
        return ServerError(statusMessage);
      }
    }
    return Exception(response.statusMessage);
  }
}

// errors
class ServerError implements Exception {
  final String message;

  const ServerError([this.message = '']);

  @override
  String toString() => 'ServerError: $message';
}

class CancelError implements Exception {
  final String message;

  const CancelError([this.message = '']);

  @override
  String toString() => 'CancelError: $message';
}

class ConnectTimeoutError implements Exception {
  final String message;

  const ConnectTimeoutError([this.message = '']);

  @override
  String toString() => 'ConnectTimeoutError: $message';
}

class SendTimeoutError implements Exception {
  final String message;

  const SendTimeoutError([this.message = '']);

  @override
  String toString() => 'SendTimeoutError: $message';
}

class ReceiveTimeoutError implements Exception {
  final String message;

  const ReceiveTimeoutError([this.message = '']);

  @override
  String toString() => 'ReceiveTimeoutError: $message';
}
