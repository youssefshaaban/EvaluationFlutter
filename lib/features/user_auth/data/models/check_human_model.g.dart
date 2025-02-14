// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_human_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckHumanModel _$CheckHumanModelFromJson(Map<String, dynamic> json) =>
    CheckHumanModel(
      human: json['human'] as bool?,
      facesDetected: (json['faces_detected'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CheckHumanModelToJson(CheckHumanModel instance) =>
    <String, dynamic>{
      'human': instance.human,
      'faces_detected': instance.facesDetected,
    };
