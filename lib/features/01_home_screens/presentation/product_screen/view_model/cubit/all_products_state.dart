part of 'all_products_cubit.dart';

@immutable
sealed class AllProductsState {}

final class AllProductsInitial extends AllProductsState {}

final class AllProductsLoading extends AllProductsState {}

final class AllProductSuccess extends AllProductsState {
  final List<ProductEntity> products;

  AllProductSuccess(this.products);
}

final class AllProductsError extends AllProductsState {
  final String errorMessage;

  AllProductsError(this.errorMessage);
}
