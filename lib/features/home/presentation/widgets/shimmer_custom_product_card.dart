import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCustomProductCard extends StatelessWidget {
  const ShimmerCustomProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(bottom: 26.r),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.8,
      ),
      itemCount: 2,
      itemBuilder: (_, index) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.kMainSecondaryColor,
              border: Border.all(
                color: AppColors.kMainSecondaryColor.withValues(alpha: 0.2),
                width: 1.2.w,
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: AppColors.kMainPrimaryColor.withValues(
                      alpha: 0.3,
                    ),
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.r,
                      vertical: 10.r,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.white,
                          highlightColor: AppColors.kMainPrimaryColor
                              .withValues(alpha: 0.3),
                          child: Container(
                            height: 12.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Shimmer.fromColors(
                          baseColor: Colors.white,
                          highlightColor: AppColors.kMainPrimaryColor
                              .withValues(alpha: 0.3),
                          child: Container(
                            height: 12.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Shimmer.fromColors(
                            baseColor: Colors.white,
                            highlightColor: AppColors.kMainPrimaryColor
                                .withValues(alpha: 0.3),
                            child: Container(
                              width: 30.r,
                              height: 30.r,
                              decoration: BoxDecoration(
                                color: AppColors.kMainPrimaryColor.withValues(
                                  alpha: 0.5,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.favorite_border_rounded,
                                color: Colors.white,
                                size: 20.r,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
