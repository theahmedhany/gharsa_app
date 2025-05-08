import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';

class CustomCategoryIcon extends StatelessWidget {
  const CustomCategoryIcon({
    super.key,
    required this.press,
    required this.icon,
    required this.title,
  });

  final VoidCallback press;
  final String icon, title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(8.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            colorFilter: const ColorFilter.mode(
              AppColors.kMainGreyColor,
              BlendMode.srcIn,
            ),
            width: 50.w,
          ),
          verticalSpace(10),
          Text(title, style: AppFonts.font16GreyBold),
        ],
      ),
    );
  }
}
