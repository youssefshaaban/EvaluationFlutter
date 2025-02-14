// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      message: json['message'] as String?,
      isAuth: json['isAuth'] as bool?,
      token: json['token'] as String?,
      comment: json['comment'] as String?,
      expireOn: json['expireOn'] as String?,
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'isAuth': instance.isAuth,
      'token': instance.token,
      'comment': instance.comment,
      'expireOn': instance.expireOn,
    };
