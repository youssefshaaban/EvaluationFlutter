enum RegisterFieldType {
  firstName,
  lastName,
  fullName,
  email,
  phoneNo,
  password,
  referancePhoto,
  companyExtention,
  unknown
}

extension RegisterFieldsExtension on RegisterFieldType {
  String get field {
    switch (this) {
      case RegisterFieldType.firstName:
        return 'firstName';
      case RegisterFieldType.lastName:
        return 'lastName';
      case RegisterFieldType.email:
        return 'email';
      case RegisterFieldType.phoneNo:
        return 'phoneNo';
      case RegisterFieldType.password:
        return 'password';
      case RegisterFieldType.referancePhoto:
        return 'referance_photo';
      case RegisterFieldType.companyExtention:
        return 'company_extention';
      default:
        return '';
    }
  }

  static RegisterFieldType getEnum(String field) {
    switch (field) {
      case 'firstName':
        return RegisterFieldType.firstName;
      case 'lastName':
        return RegisterFieldType.lastName;
      case 'email':
        return RegisterFieldType.email;
      case 'phoneNo':
        return RegisterFieldType.phoneNo;
      case 'password':
        return RegisterFieldType.password;
      case 'referance_photo':
        return RegisterFieldType.referancePhoto;
      case 'company_extention':
        return RegisterFieldType.companyExtention;
      default:
        return RegisterFieldType.unknown;
    }
  }
}
