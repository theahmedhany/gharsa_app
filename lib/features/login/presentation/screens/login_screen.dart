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
import '../../manager/login_cubit.dart';
import '../widgets/login_bloc_listener.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: 'تسجيل الدخول',
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.r, vertical: 10.r),
          child: Form(
            key: context.read<LoginCubit>().formKey,
            child: Column(
              children: [
                verticalSpace(20),
                AppTextField(
                  hintText: 'البريد الالكتروني',
                  controller: context.read<LoginCubit>().emailController,
                  validator: (value) {
                    final trimmedValue = value?.trim() ?? '';
                    if (trimmedValue.isEmpty ||
                        !AppRegex.isEmailValid(trimmedValue)) {
                      return 'من فضلك أدخل بريد إلكتروني صحيح.';
                    }
                    return null;
                  },
                ),
                verticalSpace(30),
                AppTextField(
                  hintText: 'كلمة المرور',
                  controller: context.read<LoginCubit>().passwordController,

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'من فضلك أدخل كلمة المرور.';
                    }
                    return null;
                  },
                  isObscureText: _obscureText,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.kMainGreyColor,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),

                verticalSpace(40),

                AppButton(
                  press: () {
                    validateThenDoLogin(context);
                  },
                  buttonTitle: 'تسجيل الدخول',
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
                    context.pushNamed(Routes.signupScreen);
                  },
                  borderRadius: BorderRadius.circular(12.r),
                  child: const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'لا تمتلك حساب ؟ ',
                          style: TextStyle(
                            color: AppColors.kMainGreyColor,
                            fontSize: 18,
                            height: 1.71,
                          ),
                        ),
                        TextSpan(
                          text: 'إصنع واحد',
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
                const LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
