import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:products_app/core/network/dio_factory.dart';
import 'package:products_app/core/network/network_info.dart';
import 'package:products_app/features/01_home_screens/data/products_api.dart';
import 'package:products_app/features/01_home_screens/data/remote_data_source.dart';
import 'package:products_app/features/01_home_screens/data/repository_impl.dart';
import 'package:products_app/features/01_home_screens/domain/get_products_usecase.dart';
import 'package:products_app/features/01_home_screens/domain/repository.dart';

final instance = GetIt.instance;
Future<void> initAppModule() async {
  // network info
  instance.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(InternetConnectionChecker.instance),
  );
  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory());
}

Future<void> initHomeModule() async {
  Dio dio = await instance<DioFactory>().getDio();
  //products api
  instance.registerLazySingleton<ProductsApi>(() => ProductsApi(dio));
  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(instance()),
  );
  // repository
  instance.registerLazySingleton<Repository>(
    () => RepositoryImpl(instance(), instance()),
  );
  // get products usecase
  if (!GetIt.I.isRegistered<GetProductsUsecase>()) {
    instance.registerFactory<GetProductsUsecase>(
      () => GetProductsUsecase(instance()),
    );
  }
}
