import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';

class CategoryProductsCard extends StatelessWidget {
  const CategoryProductsCard({super.key});

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
      width: double.infinity,
      height: 200.h,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(
                  'assets/images/image_3.png',
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 120.h,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0x334B8E4B),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 35.r,
                      height: 35.r,
                      decoration: BoxDecoration(
                        color: AppColors.kMainPrimaryColor.withValues(
                          alpha: 0.8,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.favorite_border_rounded,
                        color: Colors.white,
                        size: 20.r,
                      ),
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('موز بلدي', style: AppFonts.font16DarkBold),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'السعر :',
                                style: AppFonts.font14GreenMedium,
                              ),
                              TextSpan(
                                text: ' 44 جنيهاً',
                                style: AppFonts.font14DarkRegular,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
