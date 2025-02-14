import 'package:dartz/dartz.dart';
import 'package:evaluation/features/base/data/helpers/base_error.dart';
import 'package:evaluation/features/user_auth/data/models/login_model.dart';
import 'package:evaluation/features/user_auth/domain/repositories/user_repository.dart';

class LoginByNfcUsecase {
  final UserRepository _userRepository;

  LoginByNfcUsecase({required UserRepository userRepository})
      : _userRepository = userRepository;

  Future<Either<LoginModel?, BaseApiError?>> call(
      {required String code}) async {
    return await _userRepository.loginByNFC(code: code);
  }
}
