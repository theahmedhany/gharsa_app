import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';

class FavoriteProductCard extends StatelessWidget {
  const FavoriteProductCard({super.key});

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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.r, vertical: 10.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
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
                const Spacer(),
                Flexible(
                  child: Text(
                    maxLines: 1,
                    textDirection: TextDirection.rtl,
                    'اسم المنتج',
                    style: AppFonts.font18DarkBold.copyWith(
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                horizontalSpace(10),
                Container(
                  width: 120.r,
                  height: 90.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
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
              ],
            ),
            verticalSpace(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    maxLines: 1,
                    textDirection: TextDirection.rtl,
                    'فواكه',
                    style: AppFonts.font18DarkBold.copyWith(
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    maxLines: 1,
                    textDirection: TextDirection.rtl,
                    '19.89 جنيها',
                    style: AppFonts.font18GreenBold.copyWith(
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
