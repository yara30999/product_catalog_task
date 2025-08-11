import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/features/01_home_screens/presentation/product_screen/view/widgets/products_grid_view.dart';
import 'package:products_app/features/01_home_screens/presentation/product_screen/view_model/cubit/all_products_cubit.dart';

class AllProductsBlocBuilder extends StatelessWidget {
  const AllProductsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllProductsCubit, AllProductsState>(
      builder: (context, state) {
        switch (state) {
          case AllProductsInitial():
          case AllProductsLoading():
            return const Center(child: CircularProgressIndicator());
          case AllProductSuccess():
            return ProductsGridView(state.products);
          case AllProductsError():
            return Center(
              child: Text(
                state.errorMessage,
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            );
        }
      },
    );
  }
}
