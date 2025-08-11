import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:products_app/core/resourses/color_manager.dart';
import 'package:products_app/core/widgets/language_toggle_switch.dart';
import 'package:products_app/features/01_home_screens/presentation/product_screen/view/widgets/products_grid_view.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.tr("All_Products"),
          style: TextStyle(fontSize: 24.sp),
        ),
        centerTitle: true,
        foregroundColor: ColorsManager.white,
      ),
      body: Padding(
        padding: REdgeInsets.all(16.0),
        child: Column(
          spacing: 16.0.h,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.tr("Available_Products:"),
                  style: TextStyle(fontSize: 20.sp),
                ),
                LanguageToggleSwitch(),
              ],
            ),
            Expanded(child: ProductsGridView()),
          ],
        ),
      ),
    );
  }
}
