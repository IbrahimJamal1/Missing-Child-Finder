import 'package:dio/dio.dart';
import 'api_exception.dart';

class ApiErrorHandler {
  static ApiException handle(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiException(message: 'Connection timeout');

      case DioExceptionType.sendTimeout:
        return ApiException(message: 'Send timeout');

      case DioExceptionType.receiveTimeout:
        return ApiException(message: 'Receive timeout');

      case DioExceptionType.connectionError:
        return ApiException(message: 'No internet connection');

      case DioExceptionType.badResponse:
        return _handleResponse(error.response);

      case DioExceptionType.cancel:
        return ApiException(message: 'Request cancelled');

      case DioExceptionType.badCertificate:
        return ApiException(message: 'Bad certificate');

      case DioExceptionType.unknown:
        return ApiException(message: 'Something went wrong');
      case DioExceptionType.transformTimeout:
        throw UnimplementedError();
    }
  }

  static ApiException _handleResponse(Response? response) {
    if (response == null) {
      return ApiException(message: 'Something went wrong');
    }

    // final data = response.data;
    // // message from backend;
    // if (data is Map<String, dynamic>) {
    //   final chackemail = data['data']['email'];
    //   if (chackemail!=null) {
    //     return ApiException(
    //       message: chackemail.toString(),
    //       statusCode: response.statusCode,
    //     );
    //   }
    // }

    // if (data is Map<String, dynamic>) {
    //   final chackemail = data['data']['phone'];
    //   if (chackemail!=null) {
    //     return ApiException(
    //       message: chackemail.toString(),
    //       statusCode: response.statusCode,
    //     );
    //   }
    // }

    switch (response.statusCode) {
      case 400:
        return ApiException(
          message:
              'The data you entered is invalid. Please check and try again.',
          statusCode: 400,
        );

      case 401:
        return ApiException(
          message: 'Incorrect email or password.',
          statusCode: 401,
        );

      case 403:
        return ApiException(
          message: 'You do not have permission to perform this action.',
          statusCode: 403,
        );

      case 404:
        return ApiException(
          message: 'The requested data could not be found.',
          statusCode: 404,
        );

      case 422:
        return ApiException(
          message: 'Please check the entered information and try again.',
          statusCode: 422,
        );

      case 500:
        return ApiException(
          message: 'Server error. Please try again later.',
          statusCode: 500,
        );

      default:
        return ApiException(
          message: 'Something went wrong. Please try again.',
          statusCode: response.statusCode,
        );
    }
  }
}
