import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';

class HomeMainPanner extends StatelessWidget {
  const HomeMainPanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.kMainSecondaryColor,
        borderRadius: BorderRadius.circular(22.r),
        image: const DecorationImage(
          image: AssetImage('assets/images/main_page_image.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 80.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.kMainPrimaryColor,
            borderRadius: BorderRadius.circular(22.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('توصيل مجاني', style: AppFonts.font16WhiteBold),
                verticalSpace(8),
                Container(
                  width: 100.w,
                  padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 4.r),
                  decoration: BoxDecoration(
                    color: const Color(0xffFFBB56),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text(
                        'From 20 EGP',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
