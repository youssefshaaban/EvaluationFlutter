import 'package:evaluation/features/base/data/models/forms_errors.dart';

class LoginState {
  List<BaseFormError> errors;
  bool isEnableLoginButton;
  LoginState({
    this.errors = const [],
    this.isEnableLoginButton = false,
  });

  LoginState copyWith({List<BaseFormError>? errors, bool? isPhoneNumber}) {
    return LoginState(
      errors: errors ?? this.errors,
      isEnableLoginButton: isPhoneNumber ?? this.isEnableLoginButton,
    );
  }
}
