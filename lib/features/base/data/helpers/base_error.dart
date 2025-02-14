import 'package:dio/dio.dart';

class BaseApiError {
  final DioExceptionType? errorType;
  final String? errorCode;
  final String? errorMessage;

  BaseApiError({
    this.errorType,
    this.errorCode,
    this.errorMessage,
  });
}
