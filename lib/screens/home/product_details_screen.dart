import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/data/cart.dart';
import 'package:furniture_app/data/cart_model.dart';
import 'package:furniture_app/data/product.dart';
import 'package:furniture_app/screens/cart/cart_screen.dart';
import 'package:furniture_app/utils/color_resources.dart';
import 'package:provider/provider.dart';

import '../../utils/custom_themes.dart';
import 'hero_animation_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  var isStandart1 = false;
  var isStandart2 = false;
  var isCustom1 = false;
  var isCustom2 = false;

  TextEditingController colorController = TextEditingController();
  TextEditingController sizeController = TextEditingController();

  var counter = 1;

  @override
  Widget build(BuildContext context) {
    final cartModel = Provider.of<CartModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: ColorsResources.PRIMARY_BACKROUND_COLOR,
        actions: [
          InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => CartScreen()));
              },
              child: Image.asset('assets/icons/cart_active.png')),
        ],
      ),
      body: Container(
        color: ColorsResources.PRIMARY_BACKROUND_COLOR,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                color: ColorsResources.PRIMARY_BACKROUND_COLOR,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => HeroAnimationScreen(
                              product: widget.product,
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: 'heroOne',
                        child: Container(
                          color: Colors.white,
                          child: Image.asset(
                            '${widget.product.image}',
                            width: double.infinity,
                            height: 307,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${widget.product.name}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '${widget.product.price} сум',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (counter > 1) {
                                          counter--;
                                        }
                                      });
                                    },
                                    child: Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 1,
                                        ),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '$counter',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        counter++;
                                      });
                                    },
                                    child: Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 1,
                                        ),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 26,
                          ),
                          colorWidget('Цвета'),
                          SizedBox(
                            height: 30,
                          ),
                          sizeWidget('Размер'),
                          SizedBox(
                            height: 60,
                          ),
                          GestureDetector(
                            onTap: () {
                              isStandart1
                                  ? widget.product.color = 'Standart'
                                  : 'Custom';
                              isCustom1
                                  ? widget.product.color =
                                      '${colorController.text}'
                                  : '';
                              cartModel.addToCart(
                                Cart(
                                  id: '',
                                  product: widget.product,
                                  quantity: counter,
                                ),
                              );
                              cartModel.setTotalAmount(counter);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => CartScreen(),
                                ),
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              height: 54,
                              color: Color.fromRGBO(171, 116, 64, 0.9),
                              child: const Center(
                                child: Text('Добавить в корзину'),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget colorWidget(String text) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: Checkbox(
                        value: isStandart1,
                        onChanged: (bool? val) {
                          setState(() {
                            isCustom1 = false;
                            isStandart1 = val!;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Standart',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: Checkbox(
                        value: isCustom1,
                        onChanged: (bool? val) {
                          setState(() {
                            isStandart1 = false;
                            isCustom1 = val!;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Custom',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: isCustom1 ? 20 : 0,
          ),
          isCustom1
              ? Container(
                  height: 48,
                  child: TextFormField(
                    style: titleRegular.copyWith(fontSize: 18),
                    controller: colorController,
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(top: 13, left: 20),
                        child: Text(
                          '*',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Color.fromRGBO(171, 116, 64, 0.9),
                        ),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: ColorsResources.PRIMARY_COLOR,
                        ),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      labelText: 'Ваши предпочтения',
                      labelStyle: titleRegular,
                      hintStyle: titleRegular,
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }

  Widget sizeWidget(String text) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: Checkbox(
                        value: isStandart2,
                        onChanged: (bool? val) {
                          setState(() {
                            isCustom2 = false;
                            isStandart2 = val!;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Standart',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: Checkbox(
                        value: isCustom2,
                        onChanged: (bool? val) {
                          setState(() {
                            isStandart2 = false;
                            isCustom2 = val!;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Custom',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: isCustom2 ? 20 : 0,
          ),
          isCustom2
              ? Container(
                  height: 48,
                  child: TextFormField(
                    style: titleRegular.copyWith(fontSize: 18),
                    controller: sizeController,
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(top: 13, left: 20),
                        child: Text(
                          '*',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Color.fromRGBO(171, 116, 64, 0.9),
                        ),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: ColorsResources.PRIMARY_COLOR,
                        ),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      labelText: 'Ваши предпочтения',
                      labelStyle: titleRegular,
                      hintStyle: titleRegular,
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
