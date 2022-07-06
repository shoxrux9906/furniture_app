import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/data/cart.dart';
import 'package:furniture_app/screens/cart/cart_item.dart';
import 'package:furniture_app/screens/cart/checkout_screen.dart';
import 'package:furniture_app/utils/color_resources.dart';
import 'package:provider/provider.dart';

import '../../data/cart_model.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: ColorsResources.PRIMARY_BACKROUND_COLOR,
        title: Text(
          'Корзина',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Cormorant',
            fontSize: 28,
            fontWeight: FontWeight.w500,
            height: 28 / 34,
          ),
        ),
      ),
      body: Consumer<CartModel>(
        builder: ((context, cart, child) {
          Cart? myCart;
          return Container(
            color: ColorsResources.PRIMARY_BACKROUND_COLOR,
            child: cart.cartList.isNotEmpty
                ? Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 3,
                        child: ListView.builder(
                          // shrinkWrap: true,
                          // physics: NeverScrollableScrollPhysics(),
                          itemCount: cart.cartList.length,
                          itemBuilder: (context, index) {
                            myCart = cart.cartList[index];
                            return CartItem(
                              cart: cart.cartList[index],
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(
                                height: 1,
                                color: Color.fromRGBO(171, 116, 64, 0.9),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Итого',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontFamily: 'Roboto',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '10 392 000 сум',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 21,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => CheckoutScreen(),
                                  ));
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 54,
                                  color: Color.fromRGBO(171, 116, 64, 0.9),
                                  child: const Center(
                                    child: Text('Разместить заказ'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: Text(
                        'У вас нет ни одного товара в корзине',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Roboto',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          height: 18 / 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
          );
        }),
      ),
    );
  }
}
