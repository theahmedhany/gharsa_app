import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/theming/app_colors.dart';

class MainIconBox extends StatelessWidget {
  const MainIconBox({super.key, required this.icon, required this.press});

  final String icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        height: 50.r,
        width: 50.r,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: AppColors.kMainGreyColor.withValues(alpha: 0.5),
            width: 1.5,
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            icon,
            colorFilter: const ColorFilter.mode(
              AppColors.kMainGreyColor,
              BlendMode.srcIn,
            ),
            width: 22.w,
          ),
        ),
      ),
    );
  }
}
