import 'package:products_app/core/resourses/constants_manager.dart';

class ProductEntity {
  final int id;
  final String title;
  final double price;
  final String description;
  final Category category;
  final String image;
  final Rating rating;

  ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });
}

class Rating {
  final double rate;
  final int count;

  Rating({required this.rate, required this.count});
}
