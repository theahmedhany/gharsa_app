import 'package:flutter/material.dart';

import '../theming/app_colors.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.kMainPrimaryColor,
        strokeWidth: 2,
        backgroundColor: AppColors.kMainGreyColor.withValues(alpha: 0.3),
      ),
    );
  }
}
