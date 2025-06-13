import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/custom_favorite_button.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';
import '../../data/models/product_details_model.dart';

class ProductDetailsContent extends StatelessWidget {
  const ProductDetailsContent({super.key, required this.details});

  final ProductDetailsModel details;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(8.r),
          height: 300.h,
          decoration: BoxDecoration(
            color: AppColors.kMainSecondaryColor.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              width: 0.5,
              color: AppColors.kMainSecondaryColor,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: CachedNetworkImage(
              imageUrl: details.data?.imageCover ?? '',
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
        Container(
          width: double.infinity,
          constraints: BoxConstraints(minHeight: 500.h),
          decoration: BoxDecoration(
            color: AppColors.kMainSecondaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.r),
              topRight: Radius.circular(40.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              children: [
                verticalSpace(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        maxLines: 1,
                        textDirection: TextDirection.rtl,
                        '${details.data?.price} جنيه',
                        style: AppFonts.font16DarkBold.copyWith(
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        maxLines: 2,
                        textDirection: TextDirection.rtl,
                        details.data?.name ?? 'منتج غير معروف',
                        style: AppFonts.font22GreenBold.copyWith(
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpace(20),
                Text(
                  textDirection: TextDirection.rtl,
                  details.data?.description ?? 'وصف المنتج غير متوفر',
                  style: AppFonts.font14DarkRegular,
                  textAlign: TextAlign.right,
                ),
                verticalSpace(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (details.data?.discount != null &&
                        details.data!.discount! > 0)
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.r,
                          vertical: 4.r,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'خصم ${details.data?.discount} جنيه',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                    else
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.r,
                          vertical: 4.r,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'لا يوجد خصم',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          details.data?.categoryName ?? '',
                          style: AppFonts.font16DarkBold,
                        ),
                        horizontalSpace(8),
                        Text(
                          textDirection: TextDirection.rtl,
                          ' القسم:',
                          style: AppFonts.font16GreenBold,
                        ),
                      ],
                    ),
                  ],
                ),
                verticalSpace(30),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32.r,
                    vertical: 12.r,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.7),
                    border: Border.all(
                      color: AppColors.kMainPrimaryColor,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 40.r,
                          height: 40.r,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.kMainPrimaryColor,
                              width: 1.5,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '${details.data?.quantity ?? 0}',
                              maxLines: 1,
                              textDirection: TextDirection.rtl,
                              style: AppFonts.font18GreenBold,
                            ),
                          ),
                        ),
                        horizontalSpace(16),
                        Text(
                          'عدد العناصر المتاحة :',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.kMainPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                verticalSpace(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      details.data?.traderName ?? 'بائع غير معروف',
                      style: AppFonts.font16DarkBold,
                    ),
                    horizontalSpace(8),
                    Text(
                      textDirection: TextDirection.rtl,
                      'اسم البائع:',
                      style: AppFonts.font16GreenBold,
                    ),
                  ],
                ),
                verticalSpace(30),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 14.r,
                        horizontal: 10.r,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        padding: EdgeInsets.all(4.r),
                        decoration: const BoxDecoration(
                          color: AppColors.kMainPrimaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: CustomFavoriteButton(
                          itemId: details.data?.id ?? 0,
                          name: details.data?.name ?? 'منتج غير معروف',
                          price: (details.data?.price ?? 0).toDouble(),
                          imageUrl: details.data?.imageCover ?? '',
                          category:
                              details.data?.categoryName ?? 'قسم غير معروف',
                        ),
                      ),
                    ),
                    horizontalSpace(18),
                    Expanded(
                      child: AppButton(
                        press: () {
                          context.pushNamed(
                            Routes.newOrderScreen,
                            arguments: {
                              'productName':
                                  details.data?.name ?? 'منتج غير معروف',
                              'productImage': details.data?.imageCover ?? '',
                              'productPrice': details.data?.price ?? 0,
                              'productId': details.data?.id ?? 0,
                            },
                          );
                        },
                        buttonTitle: 'شراء المنتج',
                        buttonColor: AppColors.kMainPrimaryColor,
                        boarderColor: AppColors.kMainPrimaryColor,
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                ),
                verticalSpace(20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
