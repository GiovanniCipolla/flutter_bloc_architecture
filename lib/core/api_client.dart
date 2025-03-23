import 'package:dio/dio.dart';
import 'package:flutter_bloc_architecture/core/costants.dart';
import 'package:flutter_bloc_architecture/core/token_manager.dart';

class ApiClient {
  // singleton
  static final ApiClient _instance = ApiClient._internal();
  final Dio _dio = Dio();

  factory ApiClient() {
    return _instance;
  }

  ApiClient._internal() {
    _dio.options.baseUrl = Constants.baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await TokenManager.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer ${token.accessToken}';
          }
          return handler.next(options);
        },
      ),
    );
  }

  Dio get dio => _dio;
}
