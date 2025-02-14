import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:evaluation/common/constants/strings.dart';
import 'package:flutter/foundation.dart';
import '../../features/base/data/helpers/base_api_result.dart';
import '../../features/base/data/helpers/base_error.dart';
import '../../features/base/data/models/base_response.dart';
import '../../features/base/data/responses/base_error_response.dart';
import '../constants/keys.dart';
import 'api_config.dart';
import 'api_methods.dart';
import 'helpers/http_request_type.dart';

class ApiMethodsImpl implements ApiMethods {
  @override
  Future<BaseApiResult<T>> request<T>(String url,
      {required HttpRequestType type,
      Map<String, dynamic>? params,
      Map<String, dynamic>? data,
      FormData? formData,
      bool isConcreteMobile = false,
      bool hasToken = false,
      bool hasApiKey = false,
      bool needKey = false}) async {
    try {
      Response? response;
      // if (isConcreteMobile) {
      //   if (params != null) {
      //     params.addAll({
      //       'lang': Routes.navigatorKey.currentContext!.locale.languageCode
      //     });
      //   } else {
      //     params = {
      //       'lang': Routes.navigatorKey.currentContext!.locale.languageCode
      //     };
      //   }
      // }
      // if (params != null) {
      //   params.addAll(
      //       {'lang': Routes.navigatorKey.currentContext!.locale.languageCode});
      // } else {
      //   params = {
      //     'lang': Routes.navigatorKey.currentContext!.locale.languageCode
      //   };
      // }

      switch (type) {
        case HttpRequestType.post:
          response = await ApiConfig.dio.post(url,
              queryParameters: params,
              data: formData ?? data,
              options: getOptions(
                hasToken: hasToken,
                hasApiKey: hasApiKey,
              ));
        case HttpRequestType.patch:
          response = await ApiConfig.dio.patch(url,
              queryParameters: params,
              data: formData ?? data,
              options: getOptions(hasToken: hasToken, hasApiKey: hasApiKey));
        case HttpRequestType.delete:
          response = await ApiConfig.dio.delete(url,
              data: formData ?? data,
              queryParameters: params,
              options: getOptions(hasToken: hasToken, hasApiKey: hasApiKey));
        case HttpRequestType.put:
          response = await ApiConfig.dio.put(url,
              data: formData ?? data,
              queryParameters: params,
              options: getOptions(hasToken: hasToken, hasApiKey: hasApiKey));
        case HttpRequestType.get:
          response = await ApiConfig.dio.get(url,
              queryParameters: params,
              options: getOptions(hasToken: hasToken, hasApiKey: hasApiKey));
      }
      return handleResponse<T>(response);
    } on DioException catch (error) {
      return catchError<T>(error);
    }
  }

  @override
  Options getOptions({
    bool hasToken = true,
    bool hasApiKey = true,
  }) {
    Map<String, dynamic> extras = {};
    extras[Keys.authorizationRequired] = hasToken;
    extras[Keys.apiKeyRequired] = hasApiKey;
    var options = Options(
      extra: extras,
      headers: hasToken ? {Keys.authorization: 'token'} : {},
    );
    return options;
  }

  @override
  BaseApiResult<T> handleResponse<T>(Response response) {
    var responseData = response.data;
    if (responseData == null) {
      return BaseApiResult<T>(
          error: BaseApiError(errorType: DioExceptionType.unknown));
    }
    BaseResponse<T> baseResponse = BaseResponse<T>.fromJson(responseData);
    return BaseApiResult<T>(
        data: baseResponse.data, successMessage: baseResponse.successMessage);
  }

  @override
  BaseApiResult<E> catchError<E>(DioException dioError) {
    if (dioError.type == DioExceptionType.badResponse) {
      return handleApiErrors(dioError);
    } else {
      return handleDioErrors(dioError);
    }
  }

  @override
  BaseApiResult<E> handleDioErrors<E>(DioException dioError) {
    return BaseApiResult(
        error: BaseApiError(
            errorType: dioError.type,
            errorMessage: dioError.response?.statusMessage ??
                LocaleKeys.generalError.tr()));
  }

  @override
  BaseApiResult<E> handleApiErrors<E>(DioException dioError) {
    var responseData = dioError.response?.data;

    if (responseData == null) {
      return BaseApiResult<E>(
          error: BaseApiError(
              errorType: DioExceptionType.unknown,
              errorMessage: dioError.response?.statusMessage ??
                  LocaleKeys.generalError.tr()));
    } else if ((responseData is Map<String, dynamic>)) {
      BaseErrorResponse baseResponse = BaseErrorResponse.fromJson(responseData);
      debugPrint(dioError.response?.statusCode.toString());

      return BaseApiResult<E>(
        error: BaseApiError(
            errorType: dioError.type,
            errorCode: '$baseResponse.code',
            errorMessage: baseResponse.errors.first),
      );
    }
    return BaseApiResult<E>(
        error: BaseApiError(
            errorType: DioExceptionType.unknown,
            errorMessage: dioError.response?.statusMessage ??
                LocaleKeys.generalError.tr()));
  }

  Future<BaseApiResult<T>> uploadImage<T>(String url, File imageFile,
      {bool hasToken = false, bool hasApiKey = false}) async {
    try {
      String fileName = imageFile.path.split('/').last;

      // Create FormData
      FormData formData = FormData.fromMap({
        'file':
            await MultipartFile.fromFile(imageFile.path, filename: fileName),
      });

      Response response = await ApiConfig.dio.post(url,
          data: formData,
          options: getOptions(
            hasToken: hasToken,
            hasApiKey: hasApiKey,
          ));

      return handleResponse<T>(response);
    } on DioException catch (error) {
      return catchError<T>(error);
    }
  }
}
