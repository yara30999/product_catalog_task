import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:products_app/core/resourses/color_manager.dart';
import 'package:products_app/core/widgets/language_toggle_switch.dart';
import 'package:products_app/features/01_home_screens/domain/product_entity.dart';
import 'package:products_app/features/01_home_screens/presentation/product_screen/view/widgets/price_tag.dart';
import 'package:products_app/features/01_home_screens/presentation/product_screen/view/widgets/product_image.dart';
import 'package:products_app/features/01_home_screens/presentation/product_screen/view/widgets/rating_bar.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductEntity product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.tr("Products_Details"),
          style: TextStyle(fontSize: 24.sp),
        ),
        centerTitle: true,
        foregroundColor: ColorsManager.white,
      ),
      body: Padding(
        padding: REdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16.0.h,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.tr("Product:"),
                    style: TextStyle(fontSize: 20.sp),
                  ),
                  LanguageToggleSwitch(),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductImage(
                    imageUrl: product.image,
                    width: double.infinity,
                    height: 200,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    product.title,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  PriceTag(price: product.price, fontSize: 20),
                  SizedBox(height: 8.h),
                  Text(
                    product.description,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),
                  RatingBar(
                    rating: product.rating.rate,
                    ratingCount: product.rating.count,
                    itemSize: 24.sp,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
