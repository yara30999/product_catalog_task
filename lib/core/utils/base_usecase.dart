import 'package:dartz/dartz.dart';
import 'package:products_app/core/network/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute([In? input]);
}
