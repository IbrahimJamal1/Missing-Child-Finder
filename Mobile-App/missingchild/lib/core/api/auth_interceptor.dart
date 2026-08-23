import 'package:ai_safetrack/core/api/storagetoken.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Endpoints that don't need authentication
    if (options.path == '/login' || options.path == '/register') {
      handler.next(options);
      return;
    }

    // Get token from secure storage
    final token = await TokenStorage.getToken();

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }
}
