import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:products_app/features/01_home_screens/domain/product_entity.dart';
import 'package:products_app/features/01_home_screens/presentation/product_screen/view/widgets/product_card.dart';

class ProductsListView extends StatelessWidget {
  final List<ProductEntity> products;
  const ProductsListView(this.products, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.go('/products/details', extra: products[index]);
          },
          child: ProductCard(products[index]),
        );
      },
    );
  }
}
