import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:products_app/features/01_home_screens/presentation/product_screen/view/widgets/product_card.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0.w,
        mainAxisSpacing: 16.0.h,
        childAspectRatio: 0.75, // Adjust aspect ratio as needed
      ),
      itemCount: 11, // Example item count
      itemBuilder: (context, index) {
        return ProductCard();
      },
    );
  }
}
