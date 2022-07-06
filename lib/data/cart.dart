import 'package:furniture_app/data/product.dart';

class Cart {
  final String id;
  int quantity;
  final Product product;

  double totalPrice(){
    double sum = 0;
    sum = sum + quantity * double.parse(product.price);
    return sum;
  }

  Cart({
    required this.id,
    required this.product,
    required this.quantity,
  });
}
