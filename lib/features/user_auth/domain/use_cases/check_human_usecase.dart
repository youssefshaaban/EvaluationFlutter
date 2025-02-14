import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:evaluation/features/base/data/helpers/base_error.dart';
import 'package:evaluation/features/user_auth/data/models/check_human_model.dart';
import 'package:evaluation/features/user_auth/domain/repositories/user_repository.dart';

class CheckHumanUsecase {
  final UserRepository _userRepository;

  CheckHumanUsecase({required UserRepository userRepository})
      : _userRepository = userRepository;

  Future<Either<CheckHumanModel?, BaseApiError?>> call(
      {required FormData data}) async {
    return await _userRepository.checkHuman(data: data);
  }
}
