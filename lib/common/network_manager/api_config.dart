import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'interceptors/interceptor.dart';
import '../constants/api_urls.dart';

class ApiConfig {
  static Dio dio = createDio();

  static Dio createDio() {
    return Dio(BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        baseUrl: ApiUrls.baseUrl))
      ..interceptors.addAll([
        AppInterceptor(),
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      ]);
  }
}
