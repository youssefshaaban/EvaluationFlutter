import 'package:dartz/dartz.dart';
import 'package:evaluation/features/base/data/helpers/base_error.dart';
import 'package:evaluation/features/user_auth/data/models/login_model.dart';
import 'package:evaluation/features/user_auth/data/models/register_sent_model.dart';
import 'package:evaluation/features/user_auth/domain/repositories/user_repository.dart';

class RegisterUsecase {
  final UserRepository _userRepository;

  RegisterUsecase({required UserRepository userRepository})
      : _userRepository = userRepository;

  Future<Either<LoginModel?, BaseApiError?>> call(
      {required RegisterSentModel data}) async {
    return await _userRepository.register(data: data);
  }
}
