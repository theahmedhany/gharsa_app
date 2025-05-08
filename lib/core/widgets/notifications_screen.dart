import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../helpers/spacing.dart';
import '../theming/app_colors.dart';
import '../theming/app_fonts.dart';
import 'custom_app_bar.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: 'الإشعارات',
        backgroundColor: AppColors.kMainSecondaryColor,
      ),
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/no_notifications.svg',
                width: MediaQuery.sizeOf(context).width * 0.8,
              ),
              verticalSpace(20),
              Text(
                textDirection: TextDirection.rtl,
                'لا توجد إشعارات حالياً.',
                style: AppFonts.font24GreenBold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
