import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';

class SearchProductCard extends StatelessWidget {
  const SearchProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: AppColors.kMainSecondaryColor.withValues(alpha: 0.5),
          width: 1.5.w,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      margin: EdgeInsets.symmetric(horizontal: 18.r, vertical: 10.r),
      padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 8.r),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: AppColors.kMainSecondaryColor,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(
                  'assets/images/image_3.png',
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 100.h,
                ),
              ),
            ),
          ),
          horizontalSpace(10),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  maxLines: 1,
                  'اسم المنتج',
                  style: AppFonts.font18DarkBold.copyWith(
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                verticalSpace(8),
                Row(
                  children: [
                    Icon(
                      Icons.star_rate_rounded,
                      color: const Color(0xffFCD400),
                      size: 20.r,
                    ),
                    Text('4.6', style: AppFonts.font14GreyRegular),
                  ],
                ),
                verticalSpace(8),
                Text(
                  maxLines: 1,
                  textDirection: TextDirection.rtl,
                  '19.89 جنيها',
                  style: AppFonts.font18GreenBold.copyWith(
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          horizontalSpace(10),
          Column(
            children: [
              Container(
                width: 50.r,
                height: 30.r,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    '-15%',
                    textAlign: TextAlign.center,
                    style: AppFonts.font12WhiteRegular,
                  ),
                ),
              ),
              verticalSpace(10),
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(12.r),
                child: Container(
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    color: AppColors.kMainPrimaryColor.withValues(alpha: 0.8),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.favorite_border_rounded,
                    color: Colors.white,
                    size: 20.r,
                  ),
                ),
              ),
            ],
          ),
          horizontalSpace(12),
        ],
      ),
    );
  }
}
