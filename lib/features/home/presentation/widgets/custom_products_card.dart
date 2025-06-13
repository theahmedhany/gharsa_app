import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_favorite_button.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';
import '../../../best_seller/data/models/best_seller_products_model.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';

class CustomProductsCard extends StatelessWidget {
  final ProductData product;

  const CustomProductsCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          Routes.detailsScreen,
          arguments: {'productId': product.productId},
        );
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
                    imageUrl: product.pictureUrl ?? '',
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
                          itemId: product.productId ?? 0,
                          name: product.name ?? '',
                          price: product.price ?? 0.0,
                          imageUrl: product.pictureUrl ?? '',
                          category: product.categoryName ?? '',
                        ),
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            (product.name != null && product.name!.length > 10)
                                ? '${product.name?.substring(0, 10)}...'
                                : product.name ?? '',
                            style: AppFonts.font16DarkBold,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'السعر :',
                                  style: AppFonts.font14GreenMedium,
                                ),
                                TextSpan(
                                  text:
                                      (() {
                                        final priceText =
                                            '${product.price?.toStringAsFixed(2) ?? '0'} ج';
                                        return priceText.length > 8
                                            ? '${priceText.substring(0, 8)}...'
                                            : priceText;
                                      })(),
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
      ),
    );
  }
}
