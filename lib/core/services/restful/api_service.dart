import 'package:dio/dio.dart';
import 'package:mytodo_mobx_app/core/utils/base_url_util.dart';

class ApiService {
  final Dio _dio;

  ApiService()
      : _dio = Dio(BaseOptions(
          baseUrl: BaseUrl.url,
          connectTimeout: const Duration(milliseconds: 5000),
          receiveTimeout: const Duration(milliseconds: 3000),
        )) {
    _dio.interceptors.add(InterceptorsWrapper(

      onResponse: (response, handler) {
        // Do something with response data
        return handler.next(response); // continue
      },
      onError: (DioException e, handler) {
        // Handle various error types
        String errorMessage = '';
        switch (e.type) {
          case DioExceptionType.connectionTimeout:
          case DioExceptionType.sendTimeout:
          case DioExceptionType.receiveTimeout:
            errorMessage = 'Connection timeout. Please try again later.';
            break;
          case DioExceptionType.badResponse:
            if (e.response?.statusCode == 404) {
              errorMessage = 'Resource not found.';
            } else {
              errorMessage = 'Received invalid status code: ${e.response?.statusCode}';
            }
            break;
          case DioExceptionType.cancel:
            errorMessage = 'Request to API server was cancelled.';
            break;
          case DioExceptionType.unknown:
            errorMessage = 'Connection to API server failed due to internet connection.';
            break;
          case DioExceptionType.badCertificate:
            errorMessage = 'Connection to API bad sertificat.';
            break;
          case DioExceptionType.connectionError:
            errorMessage = 'Connection to API server internet connection error.';
            break;
        }
        return handler.next(DioException(
          requestOptions: e.requestOptions,
          error: errorMessage,
        ));
      },
    ));
  }

  Future<dynamic> getData(String url) async {
    try {
      final response = await _dio.get(url);
      return response.data;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> postData(String url, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(url, data: data);
      return response.data;
    } catch (e) {
      throw Exception('POST request failed: $e');
    }
  }

  Future<dynamic> putData(String url, Map<String, dynamic> data) async {
    try {
      final response = await _dio.put(url, data: data);
      return response.data;
    } catch (e) {
      throw Exception('PUT request failed: $e');
    }
  }

  Future<dynamic> deleteData(String url) async {
    try {
      final response = await _dio.delete(url);
      return response.data;
    } catch (e) {
      throw Exception('DELETE request failed: $e');
    }
  }

  Future<void> downloadFile(String url, String savePath) async {
    try {
      await _dio.download(url, savePath);
    } catch (e) {
      throw Exception('Download failed: $e');
    }
  }
}