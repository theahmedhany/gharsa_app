import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_favorite_button.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';

class SearchProductCard extends StatelessWidget {
  const SearchProductCard({
    super.key,
    required this.price,
    required this.title,
    required this.imageSrc,
    required this.press,
    required this.id,
    required this.categoryName,
  });

  final String id, title, imageSrc, categoryName;
  final VoidCallback press;
  final double price;

  static const List<String> rates = [
    '4.6',
    '4.5',
    '4.7',
    '4.8',
    '4.9',
    '5.0',
    '4.2',
    '3.6',
  ];

  static const List<String> discounts = [
    '10%',
    '15%',
    '20%',
    '25%',
    '30%',
    '35%',
    '40%',
    '50%',
  ];

  @override
  Widget build(BuildContext context) {
    final randomRate = rates[Random().nextInt(rates.length)];
    final randomdiscount = discounts[Random().nextInt(rates.length)];

    return GestureDetector(
      onTap: press,
      child: Container(
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
            horizontalSpace(14),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    maxLines: 1,
                    title,
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
                      Text(randomRate, style: AppFonts.font14GreyRegular),
                    ],
                  ),
                  verticalSpace(8),
                  Text(
                    maxLines: 1,
                    textDirection: TextDirection.rtl,
                    '$price جنيها',
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
                  height: 28.r,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      '-$randomdiscount',
                      textAlign: TextAlign.center,
                      style: AppFonts.font12WhiteRegular,
                    ),
                  ),
                ),
                verticalSpace(10),
                Container(
                  width: 35.r,
                  height: 35.r,
                  decoration: BoxDecoration(
                    color: AppColors.kMainPrimaryColor.withValues(alpha: 0.4),
                    shape: BoxShape.circle,
                  ),
                  child: CustomFavoriteButton(
                    itemId: int.parse(id),
                    name: title,
                    price: price,
                    imageUrl: imageSrc,
                    category: categoryName,
                  ),
                ),
              ],
            ),
            horizontalSpace(12),
          ],
        ),
      ),
    );
  }
}
