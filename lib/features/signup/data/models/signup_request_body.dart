import 'package:json_annotation/json_annotation.dart';

part 'signup_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  final String FirstName;
  final String LastName;
  final String Mobile;
  final String City;
  final String Governorate;
  final String Email;
  final String Password;
  final String ConfirmPassword;

  SignupRequestBody({
    required this.FirstName,
    required this.LastName,
    required this.Mobile,
    required this.City,
    required this.Governorate,
    required this.Email,
    required this.Password,
    required this.ConfirmPassword,
  });

  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}
