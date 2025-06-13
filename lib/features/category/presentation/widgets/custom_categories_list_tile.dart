import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import 'custom_brands_icon.dart';

class CustomCategoriesListTile extends StatelessWidget {
  const CustomCategoriesListTile({
    super.key,
    required this.title,
    required this.press,
    required this.imageSrc,
  });

  final String title, imageSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      contentPadding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
      leading: CustomBrandsIcon(imageSrc: imageSrc),
      title: Text(
        maxLines: 1,
        title,
        style: AppFonts.font18GreenBold.copyWith(
          overflow: TextOverflow.ellipsis,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        color: AppColors.kMainGreyColor,
      ),
    );
  }
}
