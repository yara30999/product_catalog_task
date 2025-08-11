import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:products_app/core/resourses/color_manager.dart';
import 'package:products_app/core/utils/di.dart';
import 'package:products_app/core/widgets/language_toggle_switch.dart';
import 'package:products_app/features/01_home_screens/presentation/product_screen/view/widgets/all_products_bloc_builder.dart';
import 'package:products_app/features/01_home_screens/presentation/product_screen/view_model/cubit/all_products_cubit.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  // when i do this it keep telling me that the GetProductsUsecase() is not registered in the dependency injection
  // so i but it in the main function and it works fine
  // i know it's not the best practice but i don't know how to fix it

  // @override
  // void initState() {
  //   super.initState();
  //   _initModule();
  // }

  // Future<void> _initModule() async {
  //   await initHomeModule(); //dependency injection for home module
  // }
  //

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllProductsCubit(instance())..fetchProducts(),
      child: Scaffold(
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
              Expanded(child: AllProductsBlocBuilder()),
            ],
          ),
        ),
      ),
    );
  }
}
