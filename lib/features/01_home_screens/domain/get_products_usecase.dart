import 'package:dartz/dartz.dart';
import 'package:products_app/core/network/failure.dart';
import 'package:products_app/core/utils/base_usecase.dart';
import 'package:products_app/features/01_home_screens/domain/product_entity.dart';
import 'package:products_app/features/01_home_screens/domain/repository.dart';

class GetProductsUsecase implements BaseUseCase<void, List<ProductEntity>> {
  final Repository _repository;

  GetProductsUsecase(this._repository);

  @override
  Future<Either<Failure, List<ProductEntity>>> execute([void input]) async {
    return await _repository.getProducts();
  }
}
