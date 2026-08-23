import 'package:ai_safetrack/core/api/apiservice.dart';
import 'package:ai_safetrack/core/api/endpoint.dart';
import 'package:ai_safetrack/core/api/handelerror.dart';
import 'package:ai_safetrack/features/auth/models/loginmodel.dart';
import 'package:dio/dio.dart';

class Loginrequest {
  final ApiService apiService;

  Loginrequest(this.apiService);

  Future<dynamic> login(Loginmodule model) async {
    try {
      final response = await apiService.dio.post(
        Endpoints.login,
        data: model.toJson(),
      );

      return response.data;
    } on DioException catch (e) {
      throw ApiErrorHandler.handle(e);
    }
  }
}
