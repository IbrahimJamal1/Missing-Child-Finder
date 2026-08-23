import 'package:ai_safetrack/core/api/apiservice.dart';
import 'package:ai_safetrack/core/api/endpoint.dart';
import 'package:ai_safetrack/core/api/handelerror.dart';
import 'package:ai_safetrack/features/auth/models/registermodel.dart';
import 'package:dio/dio.dart';

class Registerrequest {
  final ApiService apiService;

  Registerrequest(this.apiService);

  Future<dynamic> register(Registermodel model) async {
    try {
      final response = await apiService.dio.post(
        Endpoints.register,
        data: model.toJson(),
      );

      return response;
    } on DioException catch (e) {
      throw ApiErrorHandler.handle(e);
    }
  }
}
