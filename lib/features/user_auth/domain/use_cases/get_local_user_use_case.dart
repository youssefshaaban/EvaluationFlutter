import 'package:evaluation/features/user_auth/data/models/login_model.dart';
import '../repositories/user_repository.dart';

class GetLocalUserUseCase {
  final UserRepository _repository;

  GetLocalUserUseCase({
    required UserRepository repository,
  }) : _repository = repository;

  LoginModel? call() {
    return _repository.getLocalUserProfile();
  }
}
