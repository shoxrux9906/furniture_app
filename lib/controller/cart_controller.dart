import 'package:furniture_app/data/cart.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final cartList = [].obs;

  double _totalAmount = 0;

  double get totalAmount => _totalAmount;

  void addToCart(Cart cart) {
    cartList.add(cart);
    update();
  }

  void setTotalAmount(int quantity) {
    _totalAmount = _totalAmount * quantity;
    update();
  }

  void removeFromCart(){

  }
}
