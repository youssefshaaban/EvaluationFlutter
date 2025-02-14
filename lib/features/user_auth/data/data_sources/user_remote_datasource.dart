import 'package:dio/dio.dart';
import 'package:evaluation/common/constants/api_urls.dart';
import 'package:evaluation/common/constants/keys.dart';
import 'package:evaluation/common/network_manager/api_methods.dart';
import 'package:evaluation/common/network_manager/helpers/http_request_type.dart';
import 'package:evaluation/features/base/data/helpers/base_api_result.dart';
import 'package:evaluation/features/user_auth/data/models/check_human_model.dart';
import 'package:evaluation/features/user_auth/data/models/login_model.dart';
import 'package:evaluation/features/user_auth/data/models/register_sent_model.dart';

abstract class UserRemoteDatasource {
  Future<BaseApiResult<LoginModel>> loginByEmail(
      {required String email, required String password});
  Future<BaseApiResult<LoginModel>> loginByNFC({required String code});
  Future<BaseApiResult<LoginModel>> register({required RegisterSentModel data});
  Future<BaseApiResult<CheckHumanModel>> checkHuman({required FormData data});
}

class UserRemoteDatasourceImp extends UserRemoteDatasource {
  final ApiMethods api;
  static UserRemoteDatasourceImp? _instance;

  factory UserRemoteDatasourceImp(ApiMethods apiProvider) {
    return _instance ?? UserRemoteDatasourceImp._internal(apiProvider);
  }

  UserRemoteDatasourceImp._internal(this.api);

  @override
  Future<BaseApiResult<LoginModel>> loginByEmail(
      {required String email, required String password}) async {
    return await api.request<LoginModel>(ApiUrls.login,
        type: HttpRequestType.post,
        data: {Keys.email: email, Keys.password: password});
  }

  @override
  Future<BaseApiResult<LoginModel>> loginByNFC({required String code}) async {
    return await api.request<LoginModel>(ApiUrls.loginByNFC,
        type: HttpRequestType.post, data: {Keys.code: code});
  }

  @override
  Future<BaseApiResult<LoginModel>> register(
      {required RegisterSentModel data}) async {
    return await api
        .request(ApiUrls.register, type: HttpRequestType.post, data: {
      Keys.firstName: data.firstName,
      Keys.lastName: data.lastName,
      Keys.fullName: data.fullName,
      Keys.email: data.email,
      Keys.phoneNumber: data.phoneNumber,
      Keys.password: data.password,
      Keys.userType: data.userType,
      Keys.referancePhoto: data.referancePhoto,
      Keys.companyExtention: data.companyExtention
    });
  }

  @override
  Future<BaseApiResult<CheckHumanModel>> checkHuman(
      {required FormData data}) async {
    return await api.request(ApiUrls.checkHuman,
        type: HttpRequestType.post, formData: data);
  }
}
