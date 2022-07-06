import 'package:furniture_app/data/category.dart';

class Product {
  final String id;
  final String categoryName;
  final String image;
  String? color;
  String? size;
  final String name;
  final String price;


  Product({
    required this.id,
    required this.categoryName,
    required this.image,
    this.color,
    this.size,
    required this.name,
    required this.price,
  });
}
