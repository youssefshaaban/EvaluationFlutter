import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  final String? message;
  final bool? isAuth;
  final String? token;
  final String? comment;
  final String? expireOn;

  LoginModel(
      {required this.message,
      required this.isAuth,
      required this.token,
      required this.comment,
      required this.expireOn});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
