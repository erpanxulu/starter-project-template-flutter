import 'package:dio/dio.dart';

class ApiException {
  List<String> getExceptionMessage(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.badResponse:
        return [
          "Bad Response error",
          "Check API url or parameter is invalid",
        ];
      case DioExceptionType.connectionError:
        return [
          "Connection error",
          "Check network Connectivity",
        ];
      case DioExceptionType.connectionTimeout:
        return [
          "Connection Timeout",
          "Check network Connectivity",
        ];
      case DioExceptionType.cancel:
        return [
          "Request cancelled",
          "Check API url or parameter are invalid",
        ];
      case DioExceptionType.receiveTimeout:
        return [
          "Receive Timeout",
          "Check API url or parameter are invalid",
        ];
      default:
        return [
          "Network error",
          "Check API url or parameter are invalid",
        ];
    }
  }
}
