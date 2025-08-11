import 'package:dartz/dartz.dart';
import 'package:products_app/core/network/error_handler.dart';
import 'package:products_app/core/network/failure.dart';
import 'package:products_app/core/network/network_info.dart';
import 'package:products_app/features/01_home_screens/data/remote_data_source.dart';
import 'package:products_app/features/01_home_screens/data/mapper.dart';
import 'package:products_app/features/01_home_screens/domain/product_entity.dart';
import 'package:products_app/features/01_home_screens/domain/repository.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getProducts();
        List<ProductEntity> myEntity = [];
        for (var res in response) {
          myEntity.add(res.toDomain());
        }
        return Right(myEntity);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}
