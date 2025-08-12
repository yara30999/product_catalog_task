import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceTag extends StatelessWidget {
  final double price;
  final double fontSize;
  const PriceTag({super.key, required this.price, this.fontSize = 14});

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$${price.toStringAsFixed(2)}',
      style: TextStyle(
        fontSize: fontSize.sp,
        fontWeight: FontWeight.w600,
        color: Colors.green,
      ),
    );
  }
}
