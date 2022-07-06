import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:furniture_app/data/cart.dart';
import 'package:furniture_app/data/category.dart';
import 'package:furniture_app/data/product.dart';

import '../dummy_data.dart';

class CartModel extends ChangeNotifier {
  final List<Cart> _cartList = [];

  List<Cart> get cartList => _cartList;

  double _totalAmount = 0;

  double get totalAmount => _totalAmount;

  String _searchCategoryString = '';

  String _searchProductString = '';

  final List<Category> _categoryList = DUMMY_CATEGORIES;

  List<Category> get categoryList => _searchCategoryString.isEmpty
      ? _categoryList
      : _categoryList
          .where((element) => element.catName
              .toLowerCase()
              .contains(_searchCategoryString.toLowerCase()))
          .toList();

  void changeSearchCategoryString(String searchString) {
    _searchCategoryString = searchString;
    notifyListeners();
  }

  final List<Product> _productList = [
    Product(
        id: 'c1',
        categoryName: 'ARTUR',
        image: 'assets/images/artur/kanepe1.png',
        name: 'kanepe1',
        price: '200'),
    Product(
        id: 'c1',
        categoryName: 'ARTUR',
        image: 'assets/images/artur/KONSOL_YAN.png',
        name: 'KONSOL_YAN',
        price: '250'),
    Product(
        id: 'c2',
        categoryName: 'BABYLON',
        image: 'assets/images/babylon/BABYLON_YATAK_6.png',
        name: 'BABYLON_YATAK_6',
        price: '300'),
    Product(
        id: 'c2',
        categoryName: 'BABYLON',
        image: 'assets/images/babylon/BERJER_1.png',
        name: 'BERJER_1',
        price: '400'),
    Product(
        id: 'c3',
        categoryName: 'KLEO',
        image: 'assets/images/kleo/BERJER_1.png',
        name: 'BERJER_1',
        price: '450'),
    Product(
        id: 'c3',
        categoryName: 'KLEO',
        image: 'assets/images/kleo/DRESUAR_1.png',
        name: 'DRESUAR_1',
        price: '500'),
    Product(
        id: 'c1',
        categoryName: 'ARTUR',
        image: 'assets/images/artur/kanepe1.png',
        name: 'kanepe1',
        price: '550'),
    Product(
        id: 'c1',
        categoryName: 'ARTUR',
        image: 'assets/images/artur/KONSOL_YAN.png',
        name: 'KONSOL_YAN',
        price: '600'),
    Product(
        id: 'c2',
        categoryName: 'BABYLON',
        image: 'assets/images/babylon/BABYLON_YATAK_6.png',
        name: 'BABYLON_YATAK_6',
        price: '650'),
    Product(
        id: 'c2',
        categoryName: 'BABYLON',
        image: 'assets/images/babylon/BERJER_1.png',
        name: 'BERJER_1',
        price: '1124.6'),
    Product(
        id: 'c3',
        categoryName: 'KLEO',
        image: 'assets/images/kleo/BERJER_1.png',
        name: 'BERJER_1',
        price: '700'),
    Product(
        id: 'c3',
        categoryName: 'KLEO',
        image: 'assets/images/kleo/DRESUAR_1.png',
        name: 'DRESUAR_1',
        price: '33324.5'),
    Product(
        id: 'c1',
        categoryName: 'ARTUR',
        image: 'assets/images/artur/kanepe1.png',
        name: 'kanepe1',
        price: '750'),
    Product(
        id: 'c1',
        categoryName: 'ARTUR',
        image: 'assets/images/artur/KONSOL_YAN.png',
        name: 'KONSOL_YAN',
        price: '800'),
    Product(
        id: 'c2',
        categoryName: 'BABYLON',
        image: 'assets/images/babylon/BABYLON_YATAK_6.png',
        name: 'BABYLON_YATAK_6',
        price: '850'),
    Product(
        id: 'c2',
        categoryName: 'BABYLON',
        image: 'assets/images/babylon/BERJER_1.png',
        name: 'BERJER_1',
        price: '900'),
    Product(
        id: 'c3',
        categoryName: 'KLEO',
        image: 'assets/images/kleo/BERJER_1.png',
        name: 'BERJER_1',
        price: '499611'),
    Product(
        id: 'c3',
        categoryName: 'KLEO',
        image: 'assets/images/kleo/DRESUAR_1.png',
        name: 'DRESUAR_1',
        price: '950')
  ];

  List<Product> get productList => _searchProductString.isEmpty
      ? _productList
      : _productList
          .where((product) => product.name
              .toLowerCase()
              .contains(_searchProductString.toLowerCase()))
          .toList();

  void changeSearchProductString(String searchString){
    _searchProductString = searchString;
    notifyListeners();
  }

  void addToCart(Cart cart) {
    cartList.add(cart);
    notifyListeners();
  }

  void deleteFromCart(Cart cart) {
    cartList.length--;
    cartList.remove(cart);
    notifyListeners();
  }

  void setTotalAmount(int quantity) {
    _totalAmount = _totalAmount * quantity;
    notifyListeners();
  }
}
