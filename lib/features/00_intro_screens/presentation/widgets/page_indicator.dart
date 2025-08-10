import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:products_app/core/resourses/color_manager.dart';

class PageIndicators extends StatelessWidget {
  final int count;
  final int currentPage;
  const PageIndicators({
    super.key,
    required this.count,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
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
    );
  }
}
