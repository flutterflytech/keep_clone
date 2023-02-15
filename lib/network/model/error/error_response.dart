

import '../../base/base_response_model.dart';



class ErrorData extends BaseResponseModel{
  ErrorData({
    this.errorCode,
    this.errors,
  this.responseMessage});

  ErrorData.fromJson(dynamic json) {
    errorCode = json['errorCode'];
    responseMessage = json['responseMessage'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add(Errors.fromJson(v));
      });
    }
  }
  int? errorCode;
  List<Errors>? errors;
  String? responseMessage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map['errorCode'] = errorCode;
    if (errors != null) {
      map['errors'] = errors?.map((v) => v.toJson()).toList();
    }
    map['responseMessage'] = responseMessage;
    return map;
  }

}


class Errors {
  Errors({
    this.fieldName,
    this.message,});

  Errors.fromJson(dynamic json) {
    fieldName = json['fieldName'];
    message = json['message'];
  }
  String? fieldName;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fieldName'] = fieldName;
    map['message'] = message;
    return map;
  }

}