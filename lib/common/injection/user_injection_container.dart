import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:evaluation/features/base/data/helpers/base_state.dart';
import 'package:evaluation/features/user_auth/data/data_sources/user_locale_data_source.dart';
import 'package:evaluation/features/user_auth/data/data_sources/user_remote_datasource.dart';
import 'package:evaluation/features/user_auth/data/models/login_model.dart';
import 'package:evaluation/features/user_auth/data/repositories/user_repository_imp.dart';
import 'package:evaluation/features/user_auth/di/auth_di.dart';
import 'package:evaluation/features/user_auth/presentation/global_states/login_state.dart';
import 'package:evaluation/features/user_auth/presentation/global_states/register_state.dart';
import 'package:evaluation/features/user_auth/presentation/view_models/login_view_model.dart';
import 'package:evaluation/features/user_auth/presentation/view_models/register_view_model.dart';
import 'package:evaluation/features/user_auth/presentation/view_models/user_view_model.dart';
import 'injection_container.dart';

//User
final userLocalDataSourceProvider = Provider<UserLocaleDataSource>((ref) {
  return UserLocaleDataSource(ref.read(sharedPreferencesProvider));
});

final userRemoteDataSourceProvider = Provider<UserRemoteDatasource>((ref) {
  return UserRemoteDatasourceImp(ref.read(apiMethodProvider));
});

final userRepositoryProvider = Provider<UserRepositoryImp>((ref) {
  return UserRepositoryImp(
    localeDataSource: ref.read(userLocalDataSourceProvider),
    remoteDatasource: ref.read(userRemoteDataSourceProvider),
  );
});

final userProvider = StateNotifierProvider<UserViewModel, LoginModel?>((ref) {
  return UserViewModel(
    saveLocalUserUseCase: ref.read(saveLocalUserUseCaseProvider),
    getLocalUserUseCase: ref.read(getLocalUserUseCaseProvider),
  );
});

final loginProvider =
    StateNotifierProvider<LoginViewModel, BaseState<LoginState>>((ref) {
  return LoginViewModel(
      loginByEmailUsecase: ref.read(loginByEmailUseCaseProvider),
      loginByNfc: ref.read(loginByNFCUseCaseProvider));
});

final registerProvider =
    StateNotifierProvider<RegisterViewModel, BaseState<RegisterState>>((ref) {
  return RegisterViewModel(
      registerUsecase: ref.read(registerUseCaseProvider),
      checkHumanUsecase: ref.read(checkHumanUseCaseProvider));
});
