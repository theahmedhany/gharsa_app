import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_colors.dart';

class NewOrderTextField extends StatelessWidget {
  const NewOrderTextField({
    super.key,
    required this.hintText,
    this.isObscureText,
    this.enabled,
    this.suffixIcon,
    this.controller,
    required this.validator,
    this.keyboardType,
  });

  final String hintText;
  final bool? isObscureText;
  final bool? enabled;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final Function(String?) validator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        enabled: enabled ?? true,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: AppColors.kMainSecondaryColor.withValues(alpha: 0.2),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 24.h,
            vertical: 16.w,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              width: 1.5,
              color: AppColors.kMainPrimaryColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              width: 1.5,
              color: AppColors.kMainPrimaryColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              width: 1.5,
              color: AppColors.kMainPrimaryColor,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              width: 1.5,
              color: AppColors.kMainPrimaryColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 1.5, color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 1.5, color: Colors.red),
          ),
          hintStyle: TextStyle(
            color: Colors.black.withValues(alpha: 0.7),
            fontSize: 16.h,
          ),
          hintText: hintText,
          hintTextDirection: TextDirection.rtl,
          suffixIcon: suffixIcon,
        ),
        obscureText: isObscureText ?? false,
        style: TextStyle(color: Colors.black, fontSize: 18.sp),
        textAlign: TextAlign.right,
        cursorColor: AppColors.kMainGreyColor,
        validator: (value) => validator(value),
      ),
    );
  }
}
