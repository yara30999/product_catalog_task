// To parse this JSON data, do
//
//     final productsResponse = productsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:products_app/core/resourses/constants_manager.dart';

List<ProductResponse> productsResponseFromJson(String str) =>
    List<ProductResponse>.from(
      json.decode(str).map((x) => ProductResponse.fromJson(x)),
    );

String productsResponseToJson(List<ProductResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductResponse {
  int id;
  String title;
  double price;
  String description;
  Category category;
  String image;
  RatingResponse rating;

  ProductResponse({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      ProductResponse(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category: categoryValues.map[json["category"]]!,
        image: json["image"],
        rating: RatingResponse.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category": categoryValues.reverse[category],
    "image": image,
    "rating": rating.toJson(),
  };
}

final categoryValues = EnumValues({
  "electronics": Category.electronics,
  "jewelery": Category.jewelery,
  "men's clothing": Category.menSClothing,
  "women's clothing": Category.womenSClothing,
});

class RatingResponse {
  double rate;
  int count;

  RatingResponse({required this.rate, required this.count});

  factory RatingResponse.fromJson(Map<String, dynamic> json) =>
      RatingResponse(rate: json["rate"]?.toDouble(), count: json["count"]);

  Map<String, dynamic> toJson() => {"rate": rate, "count": count};
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
