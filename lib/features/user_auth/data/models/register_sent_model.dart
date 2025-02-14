class RegisterSentModel {
  final String firstName;
  final String lastName;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String password;
  final int userType;
  final String referancePhoto;
  final String companyExtention;

  RegisterSentModel(
      {required this.firstName,
      required this.lastName,
      required this.fullName,
      required this.email,
      required this.phoneNumber,
      required this.password,
      required this.userType,
      required this.referancePhoto,
      required this.companyExtention});
}
