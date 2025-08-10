import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:products_app/core/resourses/color_manager.dart';
import 'package:products_app/features/00_intro_screens/presentation/widgets/page_item.dart';

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

  void goToNextScreen() {
    context.go('/products');
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Onboarding", style: TextStyle(fontSize: 24.sp)),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20.h),
          // Skip Button
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: goToNextScreen,
              child: Text("Skip", style: TextStyle(fontSize: 18.sp)),
            ),
          ),
          // PageView
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingData.length,
              itemBuilder: (context, index) {
                return PageItem(onboardingData: onboardingData[index]);
              },
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
            ),
          ),
          // Page Indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onboardingData.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.all(4),
                width: currentPage == index ? 20.w : 12.w,
                height: 10.w,
                decoration: BoxDecoration(
                  color: currentPage == index
                      ? ColorsManager.primaryColor
                      : ColorsManager.grey,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          // Back / Next Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Back Button (hidden if on first page)
              if (currentPage != 0)
                TextButton(
                  onPressed: () {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10.w,
                    children: [
                      const Icon(Icons.arrow_back),
                      Text("Back", style: TextStyle(fontSize: 18.sp)),
                    ],
                  ),
                )
              else
                const SizedBox(width: 48), // keep alignment
              // Next or Finish Button
              TextButton(
                onPressed: () {
                  if (currentPage == onboardingData.length - 1) {
                    goToNextScreen();
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 10.w,
                  children: [
                    Text(
                      currentPage == onboardingData.length - 1
                          ? "Finish"
                          : "Next",
                      style: TextStyle(fontSize: 18.sp),
                    ),
                    Icon(
                      currentPage == onboardingData.length - 1
                          ? Icons.check
                          : Icons.arrow_forward,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
