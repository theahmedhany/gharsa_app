// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupRequestBody _$SignupRequestBodyFromJson(Map<String, dynamic> json) =>
    SignupRequestBody(
      FirstName: json['FirstName'] as String,
      LastName: json['LastName'] as String,
      Mobile: json['Mobile'] as String,
      City: json['City'] as String,
      Governorate: json['Governorate'] as String,
      Email: json['Email'] as String,
      Password: json['Password'] as String,
      ConfirmPassword: json['ConfirmPassword'] as String,
    );

Map<String, dynamic> _$SignupRequestBodyToJson(SignupRequestBody instance) =>
    <String, dynamic>{
      'FirstName': instance.FirstName,
      'LastName': instance.LastName,
      'Mobile': instance.Mobile,
      'City': instance.City,
      'Governorate': instance.Governorate,
      'Email': instance.Email,
      'Password': instance.Password,
      'ConfirmPassword': instance.ConfirmPassword,
    };
