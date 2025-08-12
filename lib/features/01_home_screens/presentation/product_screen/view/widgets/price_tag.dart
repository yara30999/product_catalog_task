import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceTag extends StatelessWidget {
  final double price;
  const PriceTag({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$${price.toStringAsFixed(2)}',
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: Colors.green,
      ),
    );
  }
}
