import 'package:json_annotation/json_annotation.dart';

part 'base_error_response.g.dart';

@JsonSerializable()
class BaseErrorResponse {
  @JsonKey(name: "status")
  final int code;
  @JsonKey(name: "message")
  final String error;
  @JsonKey(name: "errors")
  final List<String> errors;

  BaseErrorResponse(this.code, this.error, this.errors);

  factory BaseErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseErrorResponseFromJson(json);
}
