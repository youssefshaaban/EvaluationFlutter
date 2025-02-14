import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:evaluation/features/base/data/helpers/base_error.dart';
import 'package:evaluation/features/user_auth/data/models/check_human_model.dart';
import 'package:evaluation/features/user_auth/data/models/login_model.dart';
import 'package:evaluation/features/user_auth/data/models/register_sent_model.dart';

abstract class UserRepository {
  Future<void> setLocalUserProfile(LoginModel? userData);

  LoginModel? getLocalUserProfile();

  Future<void> removeLocalUserProfile();

  Future<Either<LoginModel?, BaseApiError?>> loginByEmail(
      {required String email, required String password});

  Future<Either<LoginModel?, BaseApiError?>> loginByNFC({required String code});

  Future<Either<LoginModel?, BaseApiError?>> register(
      {required RegisterSentModel data});

  Future<Either<CheckHumanModel?, BaseApiError?>> checkHuman(
      {required FormData data});
}
