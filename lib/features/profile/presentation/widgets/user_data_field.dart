import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharsa_app/core/helpers/spacing.dart';
import 'package:gharsa_app/core/theming/app_colors.dart';
import 'package:gharsa_app/core/theming/app_fonts.dart';

class UserDataField extends StatelessWidget {
  const UserDataField({super.key, required this.hintText, required this.title});
  final String hintText, title;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(hintText, style: AppFonts.font16GreenBold),
          verticalSpace(12),
          TextFormField(
            enabled: false,
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
                borderSide: const BorderSide(width: 1),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  width: 1,
                  color: AppColors.kMainSecondaryColor,
                ),
              ),
              hintStyle: TextStyle(color: Colors.black, fontSize: 16.h),
              hintText: title,
            ),
          ),
        ],
      ),
    );
  }
}
