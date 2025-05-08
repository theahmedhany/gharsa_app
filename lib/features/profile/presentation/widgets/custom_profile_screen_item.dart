import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gharsa_app/core/theming/app_colors.dart';
import 'package:gharsa_app/core/theming/app_fonts.dart';

class CustomProfileScreenItem extends StatelessWidget {
  const CustomProfileScreenItem({
    super.key,
    required this.text,
    required this.icon,
    required this.press,
  });

  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      contentPadding: EdgeInsets.symmetric(horizontal: 26.r),
      leading: SvgPicture.asset(
        icon,
        width: 20.w,
        colorFilter: const ColorFilter.mode(
          AppColors.kMainPrimaryColor,
          BlendMode.srcIn,
        ),
      ),
      title: Text(text, style: AppFonts.font18DarkRegular),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        color: AppColors.kMainGreyColor,
      ),
    );
  }
}
