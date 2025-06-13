import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/custom_favorite_button.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';

class BestSellerProductsCard extends StatelessWidget {
  final String imageSrc;
  final String title;
  final double price;
  final int id;
  final String categoryName;

  const BestSellerProductsCard({
    super.key,
    required this.imageSrc,
    required this.title,
    required this.price,
    required this.id,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.detailsScreen, arguments: {'productId': id});
      },
      child: Container(
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
                  color: AppColors.kMainSecondaryColor.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    width: 0.5,
                    color: AppColors.kMainSecondaryColor,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: CachedNetworkImage(
                    imageUrl: imageSrc,
                    width: double.infinity,
                    height: 120.r,
                    fit: BoxFit.cover,
                    placeholder: (context, url) {
                      return const Center(child: CustomProgressIndicator());
                    },
                    errorWidget: (context, url, error) {
                      return Center(
                        child: Image.asset(
                          'assets/master/splah_screen.png',
                          width: 100.w,
                          fit: BoxFit.contain,
                        ),
                      );
                    },
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
                  borderRadius: BorderRadius.circular(10.r),
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
                            alpha: 0.4,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: CustomFavoriteButton(
                          itemId: id,
                          name: title,
                          price: price,
                          imageUrl: imageSrc,
                          category: categoryName,
                        ),
                      ),
                      const Spacer(),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(title, style: AppFonts.font16DarkBold),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'السعر :',
                                    style: AppFonts.font14GreenMedium,
                                  ),
                                  TextSpan(
                                    text: ' $price ج',
                                    style: AppFonts.font14DarkRegular,
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
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
