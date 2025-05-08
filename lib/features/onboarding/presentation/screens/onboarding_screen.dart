import 'package:flutter/material.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../widgets/onboarding_controls.dart';
import '../widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'buttonText': 'التالي',
      'image': 'assets/images/onboarding_1.png',
      'title': 'تتوفر لدينا خضروات طازجة يوميًا بجودة عالية!',
      'description': '',
    },
    {
      'buttonText': 'التالي',
      'image': 'assets/images/onboarding_2.png',
      'title': 'استمتعوا بالنكهة الطازجة مع محاصيلنا الورقية وفواكهنا الشهية!',
      'description': '',
    },
    {
      'buttonText': 'تصفح الآن',
      'image': 'assets/images/onboarding_3.png',
      'title': 'إمتلك كل ما تحتاج',
      'description': 'محاصيل أمنة و خدمات متميزة ',
    },
  ];

  void _onNextPressed() {
    if (_currentIndex < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      context.pushNamed(Routes.beforeLoginScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMainPrimaryColor,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.kMainPrimaryColor, Colors.black],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onboardingData.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return OnboardingPage(data: onboardingData[index]);
                  },
                ),
              ),
              OnboardingControls(
                currentIndex: _currentIndex,
                totalPages: onboardingData.length,
                buttonText: onboardingData[_currentIndex]['buttonText']!,
                onNextPressed: _onNextPressed,
              ),
              verticalSpace(30),
            ],
          ),
        ],
      ),
    );
  }
}
