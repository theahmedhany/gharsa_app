import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/show_snack_bar.dart';

class BeforeLoginScreen extends StatelessWidget {
  const BeforeLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.r, vertical: 10.r),
        child: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/master/logo.png',
                  width: 300.r,
                  height: 300.r,
                ),

                verticalSpace(20),

                AppButton(
                  press: () {
                    context.pushNamed(Routes.loginScreen);
                  },
                  buttonTitle: 'تسجيل دخول ',
                  buttonColor: AppColors.kMainPrimaryColor,
                  boarderColor: AppColors.kMainPrimaryColor,
                  textColor: Colors.white,
                ),
                verticalSpace(20),

                AppButton(
                  press: () {
                    context.pushNamed(Routes.signupScreen);
                  },
                  buttonTitle: 'اشـــــتراك',
                  buttonColor: Colors.white,
                  boarderColor: AppColors.kMainPrimaryColor,
                  textColor: AppColors.kMainPrimaryColor,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
