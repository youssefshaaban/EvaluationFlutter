import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:evaluation/features/user_auth/data/models/login_model.dart';

import '../../../base/presentation/view_models/base_view_model.dart';
import '../../domain/use_cases/get_local_user_use_case.dart';
import '../../domain/use_cases/save_local_user_use_case.dart';
import '../screens/login_screen.dart';

class UserViewModel extends StateNotifier<LoginModel?> with BaseViewModel {
  final SaveLocalUserUseCase _saveLocalUserUseCase;
  final GetLocalUserUseCase _getLocalUserUseCase;

  UserViewModel({
    required SaveLocalUserUseCase saveLocalUserUseCase,
    required GetLocalUserUseCase getLocalUserUseCase,
  })  : _saveLocalUserUseCase = saveLocalUserUseCase,
        _getLocalUserUseCase = getLocalUserUseCase,
        super(getLocalUserUseCase());

  LoginModel? getLocalUserProfile() {
    LoginModel? userData = _getLocalUserUseCase();

    return userData;
  }

  void setLocalUserProfile(LoginModel? user) {
    _saveLocalUserUseCase(user: user);
    state = user;
  }

  void onInitAppUser() {
    setLocalUserProfile(getLocalUserProfile());
  }

  Future signOut() async {
    resetUserState();
    _saveLocalUserUseCase(user: null);
    navigateToScreenNamed(LoginScreen.routeName, replace: true);
  }

  void setState(LoginModel? user) {
    setLocalUserProfile(user);
  }

  void resetUserState() {
    state = null;
  }
}
