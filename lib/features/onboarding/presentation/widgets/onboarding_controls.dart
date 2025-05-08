import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';

class OnboardingControls extends StatelessWidget {
  final int currentIndex;
  final int totalPages;
  final String buttonText;
  final VoidCallback onNextPressed;

  const OnboardingControls({
    required this.currentIndex,
    required this.totalPages,
    required this.buttonText,
    required this.onNextPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: onNextPressed,
            borderRadius: BorderRadius.circular(12.r),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
              decoration: ShapeDecoration(
                color: AppColors.kMainPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Center(
                child: Text(
                  buttonText,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          verticalSpace(40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              totalPages,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 4.r),
                height: 5.h,
                width: currentIndex == index ? 50.w : 10.w,
                decoration: BoxDecoration(
                  color:
                      currentIndex == index
                          ? AppColors.kMainPrimaryColor
                          : Colors.white,
                  borderRadius: BorderRadius.circular(5.r),
                ),
              ),
            ),
          ),
          verticalSpace(20),
        ],
      ),
    );
  }
}
