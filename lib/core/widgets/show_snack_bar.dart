import 'package:flutter/material.dart';

import '../theming/app_colors.dart';
import '../theming/app_fonts.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'حسنا',
        textColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
      backgroundColor: AppColors.kMainPrimaryColor,
      content: Text(message, style: AppFonts.font12WhiteRegular),
    ),
  );
}
