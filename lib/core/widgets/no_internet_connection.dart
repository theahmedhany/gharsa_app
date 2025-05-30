import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../helpers/spacing.dart';
import '../theming/app_fonts.dart';

Scaffold noInternetConnection() {
  return Scaffold(
    backgroundColor: Colors.white,
    body: Directionality(
      textDirection: TextDirection.rtl,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/no_internet.svg',
                width: 280.w,
                height: 280.h,
              ),
              verticalSpace(20),
              Text(
                textAlign: TextAlign.center,
                "لا يوجد اتصال بالإنترنت!",
                style: AppFonts.font20DarkSemiBold,
              ),
              verticalSpace(10),
              Text(
                "يرجى التحقق من إعدادات الشبكة والمحاولة مرة أخرى.",
                textAlign: TextAlign.center,
                style: AppFonts.font14GreyRegular,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
