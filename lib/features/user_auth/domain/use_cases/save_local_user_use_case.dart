import 'package:evaluation/features/user_auth/data/models/login_model.dart';
import '../repositories/user_repository.dart';

class SaveLocalUserUseCase {
  final UserRepository _repository;

  SaveLocalUserUseCase({
    required UserRepository repository,
  }) : _repository = repository;

  Future<void> call({
    required LoginModel? user,
  }) async {
    return await _repository.setLocalUserProfile(user);
  }
}
