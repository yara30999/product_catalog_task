import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageItem extends StatelessWidget {
  const PageItem({super.key, required this.onboardingData});

  final Map<String, String> onboardingData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      spacing: 30.h,
      children: [
        Image.asset(onboardingData["image"]!, height: 250, fit: BoxFit.contain),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            onboardingData["text"]!,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
