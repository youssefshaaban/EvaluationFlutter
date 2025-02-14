import 'package:json_annotation/json_annotation.dart';

part 'check_human_model.g.dart';

@JsonSerializable()
class CheckHumanModel {
  final bool? human;
  @JsonKey(name: "faces_detected")
  final int? facesDetected;

  CheckHumanModel({required this.human, required this.facesDetected});

  factory CheckHumanModel.fromJson(Map<String, dynamic> json) =>
      _$CheckHumanModelFromJson(json);
}
