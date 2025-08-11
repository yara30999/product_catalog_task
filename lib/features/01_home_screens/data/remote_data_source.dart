import 'package:products_app/features/01_home_screens/data/products_api.dart';
import 'package:products_app/features/01_home_screens/data/products_response.dart';

abstract class RemoteDataSource {
  Future<List<ProductResponse>> getProducts();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final ProductsApi _productsApi;

  RemoteDataSourceImpl(this._productsApi);

  @override
  Future<List<ProductResponse>> getProducts() {
    return _productsApi.getProducts();
  }
}
