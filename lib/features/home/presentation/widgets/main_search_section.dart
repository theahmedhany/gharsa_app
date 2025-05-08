import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import 'main_icon_box.dart';

class MainSearchSection extends StatelessWidget {
  const MainSearchSection({
    super.key,
    required this.scaffoldKey,
    required this.onSearchPressed,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;
  final VoidCallback onSearchPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MainIconBox(
          icon: 'assets/icons/menu.svg',
          press: () {
            scaffoldKey.currentState?.openDrawer();
          },
        ),
        horizontalSpace(10),
        Expanded(
          child: InkWell(
            onTap: onSearchPressed,
            borderRadius: BorderRadius.circular(8.r),
            child: Container(
              height: 50.r,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: AppColors.kMainGreyColor.withValues(alpha: 0.5),
                  width: 1.5,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.r),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: AppColors.kMainGreyColor),
                    horizontalSpace(14),
                    Text('بحث', style: AppFonts.font16GreyRegular),
                  ],
                ),
              ),
            ),
          ),
        ),
        horizontalSpace(10),
        MainIconBox(
          icon: 'assets/icons/notifications_ring.svg',
          press: () {
            context.pushNamed(Routes.notificationsScreen);
          },
        ),
      ],
    );
  }
}
