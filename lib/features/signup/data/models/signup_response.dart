import 'package:json_annotation/json_annotation.dart';

part 'signup_response.g.dart';

@JsonSerializable()
class SignupResponse {
  final String message;
  final User user;

  SignupResponse({required this.message, required this.user});

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseToJson(this);
}

@JsonSerializable()
class User {
  final String id;
  final String displayName;
  final String firstName;
  final String lastName;
  final String mobile;
  final String governorate;
  final String city;
  final String? imageCover;
  final String email;
  final dynamic roles;

  User({
    required this.id,
    required this.displayName,
    required this.firstName,
    required this.lastName,
    required this.mobile,
    required this.governorate,
    required this.city,
    this.imageCover,
    required this.email,
    this.roles,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
