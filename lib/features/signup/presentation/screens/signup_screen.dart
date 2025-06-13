import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/show_snack_bar.dart';
import '../../manager/signup_cubit.dart';
import '../widgets/signup_bloc_listener.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignupCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(
          passwordController.text,
        );
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: 'اشـــــتراك',
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.r, vertical: 10.r),
          child: Column(
            children: [
              verticalSpace(20),
              Form(
                key: context.read<SignupCubit>().formKey,
                child: Column(
                  children: [
                    AppTextField(
                      hintText: 'الإسم الأول',
                      controller:
                          context.read<SignupCubit>().firstNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'من فضلك أدخل الإسم الأول.';
                        }
                        return null;
                      },
                    ),
                    verticalSpace(30),
                    AppTextField(
                      hintText: 'الإسم الأخير',
                      controller:
                          context.read<SignupCubit>().lastNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'من فضلك أدخل الإسم الأخير.';
                        }
                        return null;
                      },
                    ),
                    verticalSpace(30),
                    AppTextField(
                      hintText: 'رقم التليفون',
                      controller:
                          context.read<SignupCubit>().mobileNameController,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        final trimmedValue = value?.trim() ?? '';
                        if (trimmedValue.isEmpty ||
                            !AppRegex.isPhoneNumberValid(trimmedValue)) {
                          return 'من فضلك أدخل رقم التليفون.';
                        }
                        return null;
                      },
                    ),
                    verticalSpace(30),
                    AppTextField(
                      hintText: 'المدينة',
                      controller: context.read<SignupCubit>().cityController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'من فضلك أدخل المدينة';
                        }
                        return null;
                      },
                    ),
                    verticalSpace(30),
                    AppTextField(
                      hintText: 'المحافظة',
                      controller:
                          context.read<SignupCubit>().governorateController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'من فضلك أدخل المحافظة.';
                        }
                        return null;
                      },
                    ),
                    verticalSpace(30),
                    AppTextField(
                      hintText: 'البريد الالكتروني',
                      controller: context.read<SignupCubit>().emailController,
                      validator: (value) {
                        final trimmedValue = value?.trim() ?? '';
                        if (trimmedValue.isEmpty ||
                            !AppRegex.isEmailValid(trimmedValue)) {
                          return 'من فضلك أدخل البريد الإلكتروني.';
                        }
                        return null;
                      },
                    ),
                    verticalSpace(30),
                    AppTextField(
                      hintText: 'كلمة المرور',
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'من فضلك أدخل كلمة المرور.';
                        }
                        if (!AppRegex.hasLowerCase(value)) {
                          return 'يحب أن تحتوي كلمة المرور علي حروف صغيرة.';
                        }
                        if (!AppRegex.hasUpperCase(value)) {
                          return 'يجب أن تحتوي كلمة المرور علي حروف كبيرة.';
                        }
                        if (!AppRegex.hasNumber(value)) {
                          return 'يجب أن تحتوي كلمة المرور علي رقم.';
                        }
                        if (!AppRegex.hasSpecialCharacter(value)) {
                          return 'يجب أن تحتوي كلمة المرور علي حرف خاص.';
                        }
                        if (!AppRegex.hasMinLength(value)) {
                          return 'يجب ألا تقل كلمة المرور عن 8 أحرف.';
                        }
                        return null;
                      },
                      isObscureText: isPasswordObscureText,
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordObscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.kMainGreyColor,
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordObscureText = !isPasswordObscureText;
                          });
                        },
                      ),
                    ),
                    verticalSpace(30),
                    AppTextField(
                      hintText: 'تأكيد كلمة المرور',
                      controller:
                          context.read<SignupCubit>().confirmPasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'من فضلك أدخل كلمة المرور.';
                        }
                        if (value != passwordController.text) {
                          return 'كلمة المرور غير متوافقة.';
                        }
                        return null;
                      },
                      isObscureText: isPasswordConfirmationObscureText,
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordConfirmationObscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.kMainGreyColor,
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordConfirmationObscureText =
                                !isPasswordConfirmationObscureText;
                          });
                        },
                      ),
                    ),
                    verticalSpace(20),
                  ],
                ),
              ),
              verticalSpace(40),
              AppButton(
                press: () {
                  validateThenDoSignup(context);
                },
                buttonTitle: 'اشـــــتراك',
                buttonColor: AppColors.kMainPrimaryColor,
                boarderColor: AppColors.kMainPrimaryColor,
                textColor: Colors.white,
              ),
              verticalSpace(40),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      color: AppColors.kMainGreyColor,
                      height: 1.5,
                      thickness: 1.5,
                    ),
                  ),
                  horizontalSpace(10),
                  Text(
                    'أو',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.kMainGreyColor,
                    ),
                  ),
                  horizontalSpace(10),
                  const Expanded(
                    child: Divider(
                      color: AppColors.kMainGreyColor,
                      height: 1.5,
                      thickness: 1.5,
                    ),
                  ),
                ],
              ),
              verticalSpace(40),
              InkWell(
                onTap: () {
                  showSnackBar(
                    context,
                    'تسجيل الدخول باستخدام جوجل غير متاح حاليا',
                  );
                },
                borderRadius: BorderRadius.circular(12.r),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32.r,
                    vertical: 12.r,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: AppColors.kMainGreyColor,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/google.png',
                          width: 24.r,
                          height: 24.r,
                        ),
                        horizontalSpace(14),
                        Text(
                          'تسجيل دخول باستخدام جوجل',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.kMainGreyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              verticalSpace(20),
              InkWell(
                onTap: () {
                  showSnackBar(
                    context,
                    'تسجيل الدخول باستخدام فيسبوك غير متاح حاليا',
                  );
                },
                borderRadius: BorderRadius.circular(12.r),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32.r,
                    vertical: 12.r,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: AppColors.kMainGreyColor,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/facebook.png',
                          width: 24.r,
                          height: 24.r,
                        ),
                        horizontalSpace(14),
                        Text(
                          'تسجيل دخول باستخدام فيسبوك',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.kMainGreyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              verticalSpace(20),
              InkWell(
                onTap: () {
                  context.pushNamed(Routes.loginScreen);
                },
                borderRadius: BorderRadius.circular(12.r),
                child: const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'لديك حساب ؟ ',
                        style: TextStyle(
                          color: AppColors.kMainGreyColor,
                          fontSize: 18,
                          height: 1.71,
                        ),
                      ),
                      TextSpan(
                        text: 'تسجيل دخول',
                        style: TextStyle(
                          color: Color(0xFF007DFC),
                          fontSize: 18,
                          height: 1.71,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              verticalSpace(20),
              const SignupBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
    }
  }

  @override
  void dispose() {
    passwordController.removeListener(() {});
    super.dispose();
  }
}
