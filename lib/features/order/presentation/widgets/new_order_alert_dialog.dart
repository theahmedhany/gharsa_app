import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';

class NewOrderAlertDialog extends StatelessWidget {
  final String dialogHeader;
  final String dialogBody;
  final Color dialogColor;
  final IconData dialogIcon;
  final VoidCallback press;

  const NewOrderAlertDialog({
    super.key,
    required this.dialogIcon,
    required this.dialogHeader,
    required this.dialogBody,
    required this.dialogColor,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: EdgeInsets.all(20.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 230.w,
              height: 200.h,
              child: SvgPicture.asset(
                'assets/icons/check.svg',
                colorFilter: const ColorFilter.mode(
                  AppColors.kMainPrimaryColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
            verticalSpace(20),
            Text(
              dialogHeader,
              style: AppFonts.font18DarkBold.copyWith(color: Colors.black),
            ),
            verticalSpace(14),
            Text(
              dialogBody,
              textAlign: TextAlign.center,
              style: AppFonts.font14DarkMedium.copyWith(
                color: AppColors.kMainGreyColor,
              ),
            ),
            verticalSpace(26),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: press,
                style: TextButton.styleFrom(
                  backgroundColor: dialogColor,
                  padding: EdgeInsets.symmetric(vertical: 14.r),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'حسنا',
                  style: AppFonts.font14DarkMedium.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
