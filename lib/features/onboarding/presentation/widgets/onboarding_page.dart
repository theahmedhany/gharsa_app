import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/helpers/spacing.dart';

class OnboardingPage extends StatelessWidget {
  final Map<String, String> data;
  const OnboardingPage({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.kMainSecondaryColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100.r)),
          ),

          child: Image.asset(data['image']!),
        ),
        const Spacer(),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.r),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              data['title']!,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.r),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              data['description']!,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const Spacer(),
        verticalSpace(8),
      ],
    );
  }
}
