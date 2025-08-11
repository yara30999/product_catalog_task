import 'package:dio/dio.dart';
import 'package:products_app/core/resourses/constants_manager.dart';
import 'package:products_app/features/01_home_screens/data/products_response.dart';
import 'package:retrofit/retrofit.dart';
part 'products_api.g.dart';

@RestApi(baseUrl: ConstantsManager.baseUrl)
abstract class ProductsApi {
  factory ProductsApi(Dio dio, {String baseUrl}) = _ProductsApi;

  @GET("products")
  Future<List<ProductResponse>> getProducts();
}
