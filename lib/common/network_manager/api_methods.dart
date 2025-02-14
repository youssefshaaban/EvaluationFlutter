import 'package:dio/dio.dart';

import 'handlers/request_handler.dart';
import 'helpers/http_request_type.dart';
import '../../features/base/data/helpers/base_api_result.dart';

abstract class ApiMethods with AppRequestHandler {
  Future<BaseApiResult<T>> request<T>(String url,
      {required HttpRequestType type,
      Map<String, dynamic>? params,
      Map<String, dynamic>? data,
      FormData? formData,
      bool hasToken = false});
  Options getOptions({bool hasToken = true});
  @override
  BaseApiResult<T> handleResponse<T>(Response response);
  @override
  BaseApiResult<E> catchError<E>(DioException dioError);
  @override
  BaseApiResult<E> handleDioErrors<E>(DioException dioError);
  @override
  BaseApiResult<E> handleApiErrors<E>(DioException dioError);
}
