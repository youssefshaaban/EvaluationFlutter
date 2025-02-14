import 'package:dio/dio.dart';

import '../../constants/keys.dart';

mixin AppInterceptorHandler {
  Future<void> handleApiError(Dio requesterDio, DioException dioError,
      ErrorInterceptorHandler handler) async {
    var dontIntercept =
        dioError.response?.requestOptions.extra[Keys.doNotInterceptKey] ??
            false;
    if (dioError.type == DioExceptionType.badResponse) {
      if (dioError.response?.statusCode == 401 &&
          dioError.requestOptions.headers.containsKey(Keys.authorization)) {
        if (!dontIntercept) {
          //TODO refresh expired token
        } else {
          handler.reject(dioError);
        }
        handler.reject(dioError);

        return;
      }
    }
  }
}
