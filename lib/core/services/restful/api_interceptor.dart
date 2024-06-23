
import 'package:dio/dio.dart';

class ApiInterceptors extends InterceptorsWrapper {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Do something with response data
    return handler.next(response); // continue
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String errorMessage = '';

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        errorMessage = 'Connection timeout. Please try again later.';
        break;
      case DioExceptionType.badResponse:
        if (err.response?.statusCode == 404) {
          errorMessage = 'Resource not found.';
        } else {
          errorMessage = 'Received invalid status code: ${err.response?.statusCode}';
        }
        break;
      case DioExceptionType.cancel:
        errorMessage = 'Request to API server was cancelled.';
        break;
      case DioExceptionType.unknown:
        errorMessage = 'Connection to API server failed due to internet connection.';
        break;
      case DioExceptionType.badCertificate:
        errorMessage = 'Connection to API bad certificate.';
        break;
      case DioExceptionType.connectionError:
        errorMessage = 'Connection to API server internet connection error.';
        break;
    }

    return handler.next(DioException(
      requestOptions: err.requestOptions,
      error: errorMessage,
    ));
  }
}
