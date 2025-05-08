import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key,
    required this.randomWeatherImage,
    required this.formattedDate,
  });

  final String randomWeatherImage;
  final String formattedDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.r),
      child: Row(
        children: [
          SvgPicture.asset(
            randomWeatherImage,
            colorFilter: const ColorFilter.mode(
              AppColors.kMainPrimaryColor,
              BlendMode.srcIn,
            ),
            width: 28.w,
          ),

          horizontalSpace(12),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('صباح الخير', style: AppFonts.font18DarkRegular),
              verticalSpace(5),
              Text(formattedDate, style: AppFonts.font14GreyRegular),
            ],
          ),

          const Spacer(),

          InkWell(
            onTap: () {
              context.pushNamed(Routes.userAccountScreen);
            },
            borderRadius: BorderRadius.circular(50),
            child: Image.asset('assets/images/profile.png', width: 45.w),
          ),
        ],
      ),
    );
  }
}
