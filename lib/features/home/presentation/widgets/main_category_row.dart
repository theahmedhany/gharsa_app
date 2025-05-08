import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';

class MainCategoryRow extends StatelessWidget {
  const MainCategoryRow({super.key, required this.title, required this.press});

  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: press,
          borderRadius: BorderRadius.circular(8.r),
          child: Row(
            children: [
              Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColors.kMainPrimaryColor,
                size: 16.r,
              ),
              horizontalSpace(4),
              Text('عرض الكل', style: AppFonts.font16GreenBold),
            ],
          ),
        ),
        Text(title, style: AppFonts.font18DarkBold),
      ],
    );
  }
}
