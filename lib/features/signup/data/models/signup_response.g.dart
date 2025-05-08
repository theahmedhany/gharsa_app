// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponse _$SignupResponseFromJson(Map<String, dynamic> json) =>
    SignupResponse(
      message: json['message'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignupResponseToJson(SignupResponse instance) =>
    <String, dynamic>{'message': instance.message, 'user': instance.user};

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: json['id'] as String,
  displayName: json['displayName'] as String,
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  mobile: json['mobile'] as String,
  governorate: json['governorate'] as String,
  city: json['city'] as String,
  imageCover: json['imageCover'] as String?,
  email: json['email'] as String,
  roles: json['roles'],
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'displayName': instance.displayName,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'mobile': instance.mobile,
  'governorate': instance.governorate,
  'city': instance.city,
  'imageCover': instance.imageCover,
  'email': instance.email,
  'roles': instance.roles,
};
