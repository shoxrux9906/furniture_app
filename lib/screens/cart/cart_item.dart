import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/data/cart.dart';
import 'package:furniture_app/data/cart_model.dart';
import 'package:furniture_app/data/product.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  final Cart cart;

  const CartItem({Key? key, required this.cart}) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    final myModel = Provider.of<CartModel>(context, listen: false);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                color: Colors.white,
                width: 90,
                height: 90,
                child: Image.asset('${widget.cart.product.image}'),
              ),
              SizedBox(
                width: 24,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.cart.product.name}',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontFamily: 'Cormorant',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    '${widget.cart.product.price}',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontFamily: 'Cormorant',
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    'Цвет: ${widget.cart.product.color}',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontFamily: 'Cormorant',
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (widget.cart.quantity > 1) {
                              widget.cart.quantity--;
                            }
                          });
                        },
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${widget.cart.quantity}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            widget.cart.quantity++;
                          });
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  setState(() {
                    myModel.deleteFromCart(widget.cart);
                  });
                },
                child: Image.asset(
                  'assets/icons/delete.png',
                  width: 20,
                  height: 22,
                ),
              ),
              SizedBox(
                width: 16,
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Divider(
            height: 1,
            color: Color.fromRGBO(171, 116, 64, 0.9),
          ),
          SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
