import 'package:easy_localization/easy_localization.dart';
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
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24), // Rounded edges
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(120), // Shadow color
                spreadRadius: 1, // How far shadow spreads
                blurRadius: 12, // How soft shadow looks
                offset: const Offset(0, 6), // Position of shadow (x, y)
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              onboardingData["image"]!,
              height: 200.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            context.tr(onboardingData["text"]!),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
