import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/custom_profile_screen_item.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/show_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('الملف الشخصي'),
        centerTitle: true,
        backgroundColor: AppColors.kMainSecondaryColor,
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(24),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.r),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'تفاصيل الحساب.',
                        textDirection: TextDirection.rtl,
                        style: AppFonts.font18GreenBold,
                      ),
                    ),
                  ),

                  verticalSpace(16),
                  CustomProfileScreenItem(
                    text: 'الحساب الخاص بي',
                    icon: 'assets/icons/profile.svg',
                    press: () {
                      context.pushNamed(Routes.userAccountScreen);
                    },
                  ),
                  _divider(),
                  CustomProfileScreenItem(
                    text: 'الأقسام',
                    icon: 'assets/icons/category.svg',
                    press: () {
                      context.pushNamed(Routes.categoryScreen);
                    },
                  ),
                  _divider(),
                  CustomProfileScreenItem(
                    text: 'الإشعارات',
                    icon: 'assets/icons/notifications_ring.svg',
                    press: () {
                      context.pushNamed(Routes.notificationsScreen);
                    },
                  ),
                  _divider(),
                  CustomProfileScreenItem(
                    text: 'تواصل معنا',
                    icon: 'assets/icons/support.svg',
                    press: _launchSupportEmail,
                  ),
                  _divider(),
                  CustomProfileScreenItem(
                    text: 'من نحن',
                    icon: 'assets/icons/about_us.svg',
                    press: () {
                      context.pushNamed(Routes.aboutUsScreen);
                    },
                  ),
                  _divider(),
                  CustomProfileScreenItem(
                    text: 'تسجيل الخروج',
                    icon: 'assets/icons/logout.svg',
                    press: () async {
                      await SharedPrefHelper.clearAllSecuredData();
                      await SharedPrefHelper.clearAllData();
                      context.pushNamedAndRemoveUntil(
                        Routes.onboardingScreen,
                        predicate: (_) => false,
                      );
                    },
                  ),
                  _divider(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() => Divider(
    color: AppColors.kMainGreyColor.withValues(alpha: 0.5),
    endIndent: 20.r,
    indent: 20.r,
  );

  void _launchSupportEmail() {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map(
            (e) =>
                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
          )
          .join('&');
    }

    final Uri emailUrl = Uri(
      scheme: 'mailto',
      path: 'support@gharsa.com',
      query: encodeQueryParameters({
        'subject': 'Hello Gharsa Team',
        'body': 'Hi, I have a question about...',
      }),
    );

    try {
      launchUrl(emailUrl);
    } catch (_) {
      showSnackBar(context, 'تعذر تشغيل هذا الرابط ($emailUrl).');
    }
  }
}
