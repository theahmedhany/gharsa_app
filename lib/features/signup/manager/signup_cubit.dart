import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/signup_request_body.dart';
import '../data/repos/signup_repo.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(const SignupState.idle());

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileNameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController governorateController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void clearControllers() {
    firstNameController.clear();
    lastNameController.clear();
    mobileNameController.clear();
    cityController.clear();
    governorateController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  void emitSignupStates() async {
    if (!formKey.currentState!.validate()) return;

    emit(const SignupState.loading());
    try {
      final response = await _signupRepo.signup(
        SignupRequestBody(
          FirstName: firstNameController.text.trim(),
          LastName: lastNameController.text.trim(),
          Mobile: mobileNameController.text.trim(),
          City: cityController.text.trim(),
          Governorate: governorateController.text.trim(),
          Email: emailController.text.trim(),
          Password: passwordController.text.trim(),
          ConfirmPassword: confirmPasswordController.text.trim(),
        ),
      );

      response.when(
        success: (signupResponse) async {
          clearControllers();
          emit(SignupState.success(signupResponse));
        },
        failure: (error) {
          emit(
            SignupState.error(
              error:
                  error.message ??
                  "An unexpected error occurred. Please try again.",
            ),
          );
        },
      );
    } catch (e) {
      emit(
        const SignupState.error(
          error: "An unexpected error occurred. Please try again.",
        ),
      );
    }
  }
}
