import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingNavigationButtons extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final PageController pageController;
  final VoidCallback onFinish;

  const OnboardingNavigationButtons({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.pageController,
    required this.onFinish,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (currentPage != 0)
          TextButton(
            onPressed: () => pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.arrow_back),
                SizedBox(width: 10.w),
                Text(context.tr("Back"), style: TextStyle(fontSize: 18.sp)),
              ],
            ),
          )
        else
          const SizedBox(width: 48),
        TextButton(
          onPressed: () {
            if (currentPage == totalPages - 1) {
              onFinish();
            } else {
              pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            }
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                currentPage == totalPages - 1
                    ? context.tr("Finish")
                    : context.tr("Next"),
                style: TextStyle(fontSize: 18.sp),
              ),
              SizedBox(width: 10.w),
              Icon(
                currentPage == totalPages - 1
                    ? Icons.check
                    : Icons.arrow_forward,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
