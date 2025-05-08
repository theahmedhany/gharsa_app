import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_colors.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final bool? isObscureText;
  final bool? enabled;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final Function(String?) validator;

  const AppTextField({
    super.key,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.controller,
    required this.validator,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        controller: controller,
        enabled: enabled ?? true,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 24.h),

          border: const UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: AppColors.kMainGreyColor),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: AppColors.kMainGreyColor),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: AppColors.kMainPrimaryColor,
            ),
          ),
          disabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: AppColors.kMainGreyColor),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2),
          ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2),
          ),

          hintStyle: TextStyle(color: AppColors.kMainGreyColor, fontSize: 18.h),
          hintText: hintText,
          hintTextDirection: TextDirection.rtl,
          suffixIcon: suffixIcon,
          fillColor: Colors.white,
          filled: false,
        ),
        obscureText: isObscureText ?? false,
        style: TextStyle(color: AppColors.kMainGreyColor, fontSize: 18.sp),
        textAlign: TextAlign.right,
        cursorColor: AppColors.kMainGreyColor,
        validator: (value) => validator(value),
      ),
    );
  }
}
