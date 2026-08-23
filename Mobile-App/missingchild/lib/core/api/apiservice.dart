import 'package:ai_safetrack/core/api/auth_interceptor.dart';
import 'package:dio/dio.dart';

class ApiService {
  static const String baseUrl = "https://vcare.integration25.com/api/";

  final Dio dio;

  ApiService()
    : dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      ) {
    dio.interceptors.add(AuthInterceptor());
  }
}
