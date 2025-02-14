import 'base_error.dart';

class BaseApiResult<T> {
  int? status;
  T? data;
  final BaseApiError? error;
  final String? successMessage;

  BaseApiResult({this.data, this.status, this.error, this.successMessage});
}
