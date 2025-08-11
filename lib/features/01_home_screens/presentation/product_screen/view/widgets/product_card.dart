import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:products_app/features/01_home_screens/domain/product_entity.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;
  const ProductCard(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0.h),
      child: Column(
        children: [
          Image.network(
            product.image,
            fit: BoxFit.contain,
            height: 80.h,
            width: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.all(8.0.w),
            child: Text(
              product.title,
              maxLines: 2,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
