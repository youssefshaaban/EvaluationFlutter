import 'package:easy_localization/easy_localization.dart';
import 'package:evaluation/common/constants/strings.dart';
import 'package:evaluation/features/base/data/models/forms_errors.dart';
import 'package:evaluation/features/user_auth/presentation/helpers/extensions/user_fields_extension.dart';

mixin UserValidatorMixin {
  List<BaseFormError> validateUserField({
    String? email,
    String? password,
  }) {
    List<BaseFormError> errors = [];
    if (email != null) {
      if (email.isEmpty) {
        errors.add(BaseFormError(
            field: UserFieldType.email.field,
            message: LocaleKeys.emailEmptyErrorMsg.tr()));
      } else if (!isValidEmail(email)) {
        errors.add(BaseFormError(
            field: UserFieldType.email.field,
            message: LocaleKeys.emailErrorMsg.tr()));
      }
    }

    if (password != null) {
      if (password.isEmpty) {
        errors.add(BaseFormError(
            field: UserFieldType.password.field,
            message: LocaleKeys.passwordEmptyErrorMsg.tr()));
      }
    }

    return errors;
  }

  bool isValidEmail(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }

  bool isValidPassword(String password) {
    bool emailValid = password.length >= 8;
    return emailValid;
  }

  bool isPhoneNumber(String str) {
    return RegExp(r'^[0-9]').matchAsPrefix(str) != null;
  }
}
