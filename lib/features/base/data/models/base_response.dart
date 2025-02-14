import '../helpers/json_parser.dart';

class BaseResponse<T> {
  final T? data;
  final String? successMessage;
  final String? code;

  BaseResponse({this.data, this.successMessage, this.code});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      data: (json["data"] as Map<String, dynamic>).parse<T>(),
      successMessage: json["message"],
      code: json["code"],
    );
  }
}
