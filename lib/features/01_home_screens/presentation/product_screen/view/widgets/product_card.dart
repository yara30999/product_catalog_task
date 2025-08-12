import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:products_app/features/01_home_screens/domain/product_entity.dart';
import 'package:products_app/features/01_home_screens/presentation/product_screen/view/widgets/price_tag.dart';
import 'package:products_app/features/01_home_screens/presentation/product_screen/view/widgets/product_image.dart';
import 'package:products_app/features/01_home_screens/presentation/product_screen/view/widgets/rating_bar.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;
  const ProductCard(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: Padding(
        padding: REdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(flex: 5, child: ProductImage(imageUrl: product.image)),
            const Spacer(flex: 1),
            Expanded(
              flex: 13,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                spacing: 8.h,
                children: [
                  Text(
                    product.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  PriceTag(price: product.price),
                  RatingBar(
                    rating: product.rating.rate,
                    ratingCount: product.rating.count,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
