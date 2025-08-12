import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingBar extends StatelessWidget {
  final double rating;
  final int ratingCount;
  final double itemSize;
  const RatingBar({
    super.key,
    required this.rating,
    required this.ratingCount,
    this.itemSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBarIndicator(
          rating: rating,
          itemBuilder: (context, _) =>
              const Icon(Icons.star, color: Colors.amber),
          itemCount: 5,
          itemSize: itemSize.sp,
          direction: Axis.horizontal,
        ),
        SizedBox(width: 6.w),
        Text(
          '($ratingCount)',
          style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
        ),
      ],
    );
  }
}
