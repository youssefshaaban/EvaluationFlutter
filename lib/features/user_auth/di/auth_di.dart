import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:evaluation/common/injection/user_injection_container.dart';
import 'package:evaluation/features/user_auth/domain/use_cases/check_human_usecase.dart';
import 'package:evaluation/features/user_auth/domain/use_cases/get_local_user_use_case.dart';
import 'package:evaluation/features/user_auth/domain/use_cases/login_by_email_usecase.dart';
import 'package:evaluation/features/user_auth/domain/use_cases/login_by_nfc_usecase.dart';
import 'package:evaluation/features/user_auth/domain/use_cases/register_usecase.dart';
import 'package:evaluation/features/user_auth/domain/use_cases/save_local_user_use_case.dart';

final saveLocalUserUseCaseProvider = Provider<SaveLocalUserUseCase>((ref) {
  return SaveLocalUserUseCase(
    repository: ref.read(userRepositoryProvider),
  );
});

final getLocalUserUseCaseProvider = Provider<GetLocalUserUseCase>((ref) {
  return GetLocalUserUseCase(
    repository: ref.read(userRepositoryProvider),
  );
});

final loginByEmailUseCaseProvider = Provider<LoginByEmailUsecase>((ref) {
  return LoginByEmailUsecase(
    userRepository: ref.read(userRepositoryProvider),
  );
});

final loginByNFCUseCaseProvider = Provider<LoginByNfcUsecase>((ref) {
  return LoginByNfcUsecase(
    userRepository: ref.read(userRepositoryProvider),
  );
});

final registerUseCaseProvider = Provider<RegisterUsecase>((ref) {
  return RegisterUsecase(
    userRepository: ref.read(userRepositoryProvider),
  );
});

final checkHumanUseCaseProvider = Provider<CheckHumanUsecase>((ref) {
  return CheckHumanUsecase(
    userRepository: ref.read(userRepositoryProvider),
  );
});
