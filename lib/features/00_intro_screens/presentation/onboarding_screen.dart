import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:products_app/core/resourses/color_manager.dart';
import 'package:products_app/core/widgets/language_toggle_switch.dart';
import 'package:products_app/features/00_intro_screens/presentation/widgets/onboarding_nav_buttons.dart';
import 'package:products_app/features/00_intro_screens/presentation/widgets/onboarding_page_view.dart';
import 'package:products_app/features/00_intro_screens/presentation/widgets/page_indicator.dart';
import 'package:products_app/features/00_intro_screens/presentation/widgets/skip_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/png/onboarding_1.png",
      "text": "Discover amazing products at great prices",
    },
    {
      "image": "assets/png/onboarding_2.png",
      "text": "Shop easily and securely from anywhere",
    },
  ];

  void goToNextScreen() => context.go('/products');

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.tr("Onboarding"),
          style: TextStyle(fontSize: 24.sp),
        ),
        centerTitle: true,
        foregroundColor: ColorsManager.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Spacer(),
              SkipButton(onSkip: goToNextScreen),
            ],
          ),
          Expanded(
            child: OnboardingPageView(
              pageController: _pageController,
              onboardingData: onboardingData,
              onPageChanged: (index) => setState(() => currentPage = index),
            ),
          ),
          PageIndicators(
            count: onboardingData.length,
            currentPage: currentPage,
          ),
          OnboardingNavigationButtons(
            currentPage: currentPage,
            totalPages: onboardingData.length,
            pageController: _pageController,
            onFinish: goToNextScreen,
          ),
          LanguageToggleSwitch(),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
