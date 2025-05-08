import 'package:flutter/material.dart';

import '../helpers/extensions.dart';
import '../theming/app_colors.dart';
import '../theming/app_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  const CustomAppBar({
    super.key,
    required this.title,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      scrolledUnderElevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColors.kMainGreyColor,
        ),
        onPressed: () {
          context.pop();
        },
      ),
      title: Text(title, style: AppFonts.font18DarkBold),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
