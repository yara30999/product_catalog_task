import 'package:products_app/core/resourses/constants_manager.dart';
import 'package:products_app/core/resourses/extentions.dart';
import 'package:products_app/features/01_home_screens/data/products_response.dart';
import 'package:products_app/features/01_home_screens/domain/product_entity.dart';

extension ProductResponseMapper on ProductResponse? {
  ProductEntity toDomain() {
    return ProductEntity(
      id: this!.id.orZero(),
      title: this!.title.orEmpty(),
      price: this!.price.orZero(),
      description: this!.description.orEmpty(),
      category: this?.category ?? Category.electronics,
      image: this!.image.orEmpty(),
      rating: this!.rating.toDomain(),
    );
  }
}

extension RatingResponseMapper on RatingResponse? {
  Rating toDomain() {
    return Rating(rate: this!.rate.orZero(), count: this!.count.orZero());
  }
}
