import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0.h),
      child: ListTile(
        title: Text('Product', style: TextStyle(fontSize: 18.sp)),
        subtitle: Text(
          'Description of product',
          style: TextStyle(fontSize: 14.sp),
        ),
      ),
    );
  }
}
