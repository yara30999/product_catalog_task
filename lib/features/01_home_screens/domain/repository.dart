import 'package:dartz/dartz.dart';
import 'package:products_app/core/network/failure.dart';
import 'package:products_app/features/01_home_screens/domain/product_entity.dart';

abstract class Repository {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
}
