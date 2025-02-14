import 'package:easy_localization/easy_localization.dart';
import 'package:evaluation/common/constants/strings.dart';
import 'package:evaluation/features/base/data/models/forms_errors.dart';
import 'package:evaluation/features/user_auth/presentation/helpers/extensions/register_fields_extension.dart';

mixin RegisterValidatorMixin {
  validateRegisterField(
      {String? firstName,
      String? lastName,
      String? fullName,
      String? email,
      String? phoneNo,
      String? password,
      String? referancePhoto,
      String? companyExtention}) {
    List<BaseFormError> errors = [];
    if (firstName != null) {
      if (firstName.isEmpty) {
        errors.add(BaseFormError(
            field: RegisterFieldType.firstName.field,
            message: LocaleKeys.firstNameErrorMsg.tr()));
      }
    }

    if (lastName != null) {
      if (lastName.isEmpty) {
        errors.add(BaseFormError(
            field: RegisterFieldType.lastName.field,
            message: LocaleKeys.lastNameErrorMsg.tr()));
      }
    }

    if (fullName != null) {
      if (fullName.isEmpty) {
        errors.add(BaseFormError(
            field: RegisterFieldType.fullName.field,
            message: LocaleKeys.lastNameErrorMsg.tr()));
      }
    }

    if (email != null) {
      if (email.isEmpty) {
        errors.add(BaseFormError(
            field: RegisterFieldType.email.field,
            message: LocaleKeys.emailErrorMsg.tr()));
      }
    }

    if (phoneNo != null) {
      if (phoneNo.isEmpty) {
        errors.add(BaseFormError(
            field: RegisterFieldType.phoneNo.field,
            message: LocaleKeys.phoneErrorMsg.tr()));
      }
    }

    if (password != null) {
      if (password.isEmpty) {
        errors.add(BaseFormError(
            field: RegisterFieldType.password.field,
            message: LocaleKeys.passwordEmptyErrorMsg.tr()));
      }
    }

    if (companyExtention != null) {
      if (companyExtention.isEmpty) {
        errors.add(BaseFormError(
            field: RegisterFieldType.companyExtention.field,
            message: LocaleKeys.companyExtensionErrorMsg.tr()));
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
    bool emailValid = password.length >= 12;
    return emailValid;
  }

  bool isValidPhoneNo(String phone) {
    bool phoneValid = RegExp(r'^01\d{9}$').hasMatch(phone);
    return phoneValid;
  }
}
