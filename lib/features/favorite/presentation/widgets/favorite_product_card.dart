import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';
import '../../manager/favorite_cubit.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../data/models/favorite_model.dart';

class FavoriteProductCard extends StatelessWidget {
  const FavoriteProductCard({super.key, required this.product});

  final FavoriteProductData product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.detailsScreen,
          arguments: {'productId': product.productId},
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 18.r, vertical: 10.r),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: AppColors.kMainSecondaryColor.withValues(alpha: 0.5),
            width: 1.5.w,
          ),
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(14.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100.r,
                    height: 90.r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        width: 0.5,
                        color: AppColors.kMainSecondaryColor,
                      ),
                      color: AppColors.kMainSecondaryColor.withValues(
                        alpha: 0.1,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: CachedNetworkImage(
                        imageUrl: product.pictureUrl ?? '',
                        fit: BoxFit.cover,
                        placeholder:
                            (context, url) =>
                                const Center(child: CustomProgressIndicator()),
                        errorWidget:
                            (context, url, error) => Center(
                              child: Image.asset(
                                'assets/master/splah_screen.png',
                                fit: BoxFit.contain,
                                width: 70.w,
                              ),
                            ),
                      ),
                    ),
                  ),
                  horizontalSpace(20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                product.categoryName ?? 'اسم التصنيف',
                                textDirection: TextDirection.rtl,
                                style: AppFonts.font18DarkBold.copyWith(
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 1,
                              ),
                            ),
                            const Spacer(),
                            Expanded(
                              child: Text(
                                product.name ?? 'اسم المنتج',
                                textDirection: TextDirection.rtl,
                                style: AppFonts.font18DarkBold.copyWith(
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                context.read<FavoriteCubit>().toggleFavorite(
                                  product,
                                );
                              },
                              borderRadius: BorderRadius.circular(12.r),
                              child: Container(
                                padding: EdgeInsets.all(6.r),
                                decoration: BoxDecoration(
                                  color: AppColors.kMainPrimaryColor.withValues(
                                    alpha: 0.3,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.favorite_rounded,
                                  color: Colors.red,
                                  size: 20.r,
                                ),
                              ),
                            ),
                            horizontalSpace(6),
                            Text(
                              '${product.price?.toStringAsFixed(2) ?? '0.00'} جنيها',
                              textDirection: TextDirection.rtl,
                              style: AppFonts.font18GreenBold.copyWith(
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
