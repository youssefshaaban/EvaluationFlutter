import 'package:evaluation/features/base/data/models/forms_errors.dart';

class RegisterState {
  List<BaseFormError> errors;
  RegisterState({
    this.errors = const [],
  });

  RegisterState copyWith({List<BaseFormError>? errors}) {
    return RegisterState(
      errors: errors ?? this.errors,
    );
  }
}
