import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:evaluation/common/injection/user_injection_container.dart';
import 'package:evaluation/common/network_manager/api_config.dart';

import '../../constants/keys.dart';
import '../../constants/routes.dart';
import '../handlers/interceptor_handler.dart';

class AppInterceptor extends Interceptor with AppInterceptorHandler {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String baseUrl = options.baseUrl;

    if (baseUrl.endsWith('/')) {
      baseUrl = baseUrl.substring(0, baseUrl.length - 1);
    }

    if (!(options.extra[Keys.doNotInterceptKey] ?? false)) {
      if (options.extra.containsKey(Keys.apiKeyRequired) &&
          (options.extra[Keys.apiKeyRequired] as bool)) {}

      if (options.extra.containsKey(Keys.authorizationRequired) &&
          (options.extra[Keys.authorizationRequired] as bool)) {
        options.headers[Keys.authorization] = 'Bearer $_token';
      } else {
        options.path = '$baseUrl/${options.path}';
      }
    }
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    await handleApiError(ApiConfig.dio, err, handler);
    super.onError(err, handler);
  }

  static String get _token =>
      ProviderScope.containerOf(Routes.navigatorKey.currentContext!,
              listen: false)
          .read(userProvider)!
          .token ??
      '';
}
