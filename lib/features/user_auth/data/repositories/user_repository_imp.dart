import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/form_data.dart';
import 'package:evaluation/features/base/data/helpers/base_error.dart';
import 'package:evaluation/features/user_auth/data/data_sources/user_remote_datasource.dart';
import 'package:evaluation/features/user_auth/data/data_sources/user_locale_data_source.dart';
import 'package:evaluation/features/user_auth/data/models/check_human_model.dart';
import 'package:evaluation/features/user_auth/data/models/login_model.dart';
import 'package:evaluation/features/user_auth/data/models/register_sent_model.dart';
import 'package:evaluation/features/user_auth/domain/repositories/user_repository.dart';

class UserRepositoryImp extends UserRepository {
  UserRemoteDatasource remoteDatasource;
  UserLocaleDataSource localeDataSource;
  UserRepositoryImp(
      {required this.remoteDatasource, required this.localeDataSource});
  @override
  Future<Either<LoginModel?, BaseApiError?>> loginByEmail(
      {required String email, required String password}) async {
    final response =
        await remoteDatasource.loginByEmail(email: email, password: password);
    if (response.error != null) {
      return Right(response.error);
    }

    if (response.data != null) {
      return Left(response.data);
    } else {
      return Right(response.error);
    }
  }

  @override
  Future<Either<LoginModel?, BaseApiError?>> loginByNFC(
      {required String code}) async {
    final response = await remoteDatasource.loginByNFC(code: code);
    if (response.error != null) {
      return Right(response.error);
    }

    if (response.data != null) {
      return Left(response.data);
    } else {
      return Right(response.error);
    }
  }

  @override
  Future<Either<LoginModel?, BaseApiError?>> register(
      {required RegisterSentModel data}) async {
    final response = await remoteDatasource.register(data: data);
    if (response.error != null) {
      return Right(response.error);
    }

    if (response.data != null) {
      return Left(response.data);
    } else {
      return Right(response.error);
    }
  }

  @override
  Future<Either<CheckHumanModel?, BaseApiError?>> checkHuman(
      {required FormData data}) async {
    final response = await remoteDatasource.checkHuman(data: data);
    if (response.error != null) {
      return Right(response.error);
    }

    if (response.data != null) {
      return Left(response.data);
    } else {
      return Right(response.error);
    }
  }

  @override
  LoginModel? getLocalUserProfile() {
    return localeDataSource.getLocalUser();
  }

  @override
  Future<void> removeLocalUserProfile() {
    return localeDataSource.removeLocalUser();
  }

  @override
  Future<void> setLocalUserProfile(LoginModel? userData) async {
    if (userData != null) {
      localeDataSource.saveLocalUser(userData);
    } else {
      localeDataSource.removeLocalUser();
    }
  }
}
