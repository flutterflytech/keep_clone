

import '../../base/base_response_model.dart';
import '../error/error_response.dart';






class LoginResponse extends BaseResponseModel{
  LoginResponse({
    this.statusCode,
    this.responseData,
    this.errorData,
    this.time,});

  LoginResponse.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    responseData = json['responseData'] != null ? LoginResponseData.fromJson(json['responseData']) : null;
    errorData = json['error'] != null ? ErrorData.fromJson(json['error']) : null;

    time = json['time'];
  }
  int? statusCode;
  LoginResponseData? responseData;
  ErrorData? errorData;

  String? time;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = statusCode;
    if (responseData != null) {
      map['responseData'] = responseData?.toJson();
    }
    if (errorData != null) {
      map['error'] = errorData?.toJson();
    }
    map['time'] = time;
    return map;
  }

}

class LoginResponseData {
  LoginResponseData({
    this.message,
    this.userDetails,});

  LoginResponseData.fromJson(dynamic json) {
    message = json['message'];
    userDetails = json['UserDetails'] != null ? UserDetails.fromJson(json['UserDetails']) : null;
  }
  String? message;
  UserDetails? userDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (userDetails != null) {
      map['UserDetails'] = userDetails?.toJson();
    }


    return map;
  }

}

class UserDetails {
  UserDetails({
    this.userId,
    this.name,
    this.mobileNo,
    this.email,
    this.membershipId,
    this.status,
    this.created,});

  UserDetails.fromJson(dynamic json) {
    userId = json['userId'];
    name = json['name'];
    mobileNo = json['mobileNo'];
    email = json['email'];
    membershipId = json['membershipId'];
    status = json['status'];
    created = json['created'];
  }
  String? userId;
  String? name;
  String? mobileNo;
  String? email;
  String? membershipId;
  int? status;
  String? created;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['name'] = name;
    map['mobileNo'] = mobileNo;
    map['email'] = email;
    map['membershipId'] = membershipId;
    map['status'] = status;
    map['created'] = created;
    return map;
  }

}



