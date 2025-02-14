import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:evaluation/common/constants/routes.dart';
import 'package:evaluation/common/injection/user_injection_container.dart';
import 'package:evaluation/features/base/data/helpers/base_state.dart';
import 'package:evaluation/features/base/presentation/view_models/base_view_model.dart';
import 'package:evaluation/features/user_auth/data/models/login_model.dart';
import 'package:evaluation/features/user_auth/domain/use_cases/login_by_email_usecase.dart';
import 'package:evaluation/features/user_auth/domain/use_cases/login_by_nfc_usecase.dart';
import 'package:evaluation/features/user_auth/presentation/global_states/login_state.dart';
import 'package:evaluation/features/user_auth/presentation/helpers/mixins/user_validator_mixin.dart';

class LoginViewModel extends StateNotifier<BaseState<LoginState>>
    with UserValidatorMixin, BaseViewModel {
  final LoginByEmailUsecase _loginbyEmailUsecase;
  final LoginByNfcUsecase _loginByNfc;

  LoginViewModel(
      {required LoginByEmailUsecase loginByEmailUsecase,
      required LoginByNfcUsecase loginByNfc})
      : _loginbyEmailUsecase = loginByEmailUsecase,
        _loginByNfc = loginByNfc,
        super(BaseState(data: LoginState(errors: [])));

  Future<LoginModel?> loginByEmail(
      {required String email, required String password}) async {
    hideKeyboard();
    state = state.copyWith(
        data: state.data.copyWith(
            errors: validateUserField(email: email, password: password)));
    if (state.data.errors.isNotEmpty) return null;
    state = state.copyWith(isLoading: true);
    final response =
        await _loginbyEmailUsecase(email: email, password: password);
    state = state.copyWith(isLoading: false);
    return response.fold((user) {
      Routes.navigatorKey.providerScope
          ?.read(userProvider.notifier)
          .setLocalUserProfile(user);
      return user;
    }, (error) {
      handleError(error: error);
      return null;
    });
  }

  Future<LoginModel?> loginByNFC({required String code}) async {
    hideKeyboard();
    state = state.copyWith(isLoading: true);
    final response = await _loginByNfc(code: code);
    state = state.copyWith(isLoading: false);
    return response.fold((user) {
      Routes.navigatorKey.providerScope
          ?.read(userProvider.notifier)
          .setLocalUserProfile(user);
      return user;
    }, (error) {
      handleError(error: error);
      return null;
    });
  }
}
