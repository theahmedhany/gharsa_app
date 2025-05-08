import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../helpers/spacing.dart';
import '../theming/app_colors.dart';
import '../theming/app_fonts.dart';
import 'custom_app_bar.dart';
import 'show_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: 'من نحن',
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(10),
                  Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      width: 100.w,
                      height: 100.h,
                      'assets/icons/about_us.svg',
                      colorFilter: const ColorFilter.mode(
                        AppColors.kMainPrimaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  verticalSpace(16),
                  Align(
                    alignment: Alignment.center,
                    child: Text('حول غرسة', style: AppFonts.font20DarkSemiBold),
                  ),
                  verticalSpace(32),
                  Text('مرحبًا بك في غرسة!', style: AppFonts.font18DarkRegular),
                  verticalSpace(12),
                  Text(
                    'في غرسة، نهدف إلى توفير أفضل المنتجات الزراعية الطازجة بطريقة صحية وسهلة. نحن منصة تجارة إلكترونية حديثة تهدف إلى تلبية احتياجاتك من الخضروات والفواكه الطازجة بجودة عالية وأسعار مناسبة.',
                    style: AppFonts.font14GreyRegular,
                  ),
                  verticalSpace(24),
                  Text('مهمتنا', style: AppFonts.font18DarkRegular),
                  verticalSpace(12),
                  Text(
                    'نؤمن بأن الغذاء الصحي يجب أن يكون متاحًا للجميع. مهمتنا هي تقديم تجربة تسوق سهلة وسريعة لمنتجات طازجة مباشرة من المزرعة إلى باب بيتك.',
                    style: AppFonts.font14GreyRegular,
                  ),
                  verticalSpace(24),
                  Text('لماذا تختار غرسة؟', style: AppFonts.font18DarkRegular),
                  verticalSpace(12),
                  Text(
                    '• منتجات طازجة مختارة بعناية.',
                    style: AppFonts.font14GreyRegular,
                  ),
                  verticalSpace(12),
                  Text(
                    '• جودة مضمونة من أفضل المزارع.',
                    style: AppFonts.font14GreyRegular,
                  ),
                  verticalSpace(12),
                  Text(
                    '• توصيل سريع وآمن لجميع المناطق.',
                    style: AppFonts.font14GreyRegular,
                  ),
                  verticalSpace(12),
                  Text(
                    '• سياسة استرجاع سهلة في حال لم تكن راضيًا.',
                    style: AppFonts.font14GreyRegular,
                  ),
                  verticalSpace(24),
                  Text('تواصل معنا', style: AppFonts.font18DarkRegular),
                  verticalSpace(12),
                  Text(
                    'لديك استفسار أو اقتراح؟ يسعدنا تواصلك معنا في أي وقت.',
                    style: AppFonts.font14GreyRegular,
                  ),
                  verticalSpace(12),
                  InkWell(
                    onTap: () {
                      String? encodeQueryParameters(
                        Map<String, String> params,
                      ) {
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
                      } catch (e) {
                        showSnackBar(
                          context,
                          'تعذر فتح هذا الرابط ($emailUrl).',
                        );
                      }
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Text(
                      'البريد الإلكتروني: support@gharsa.com',
                      style: AppFonts.font14GreenMedium.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  verticalSpace(32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
