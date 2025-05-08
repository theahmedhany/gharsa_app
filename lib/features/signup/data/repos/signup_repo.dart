import 'package:dio/dio.dart';

import '../../../../core/networking/api_network_exceptions.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';
import '../models/signup_request_body.dart';
import '../models/signup_response.dart';

class SignupRepo {
  final ApiServices _apiServices;

  SignupRepo(this._apiServices);

  Future<ApiResult<SignupResponse>> signup(
    SignupRequestBody signupRequestBody,
  ) async {
    try {
      final formData = FormData();

      final Map<String, dynamic> json = signupRequestBody.toJson();
      json.forEach((key, value) {
        formData.fields.add(MapEntry(key, value.toString()));
      });

      final response = await _apiServices.signup(formData);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
