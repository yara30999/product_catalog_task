import 'package:flutter/material.dart';
import 'package:products_app/features/00_intro_screens/presentation/widgets/page_item.dart';

class OnboardingPageView extends StatelessWidget {
  final PageController pageController;
  final List<Map<String, String>> onboardingData;
  final ValueChanged<int> onPageChanged;

  const OnboardingPageView({
    super.key,
    required this.pageController,
    required this.onboardingData,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: onboardingData.length,
      itemBuilder: (context, index) {
        return PageItem(onboardingData: onboardingData[index]);
      },
      onPageChanged: onPageChanged,
    );
  }
}
