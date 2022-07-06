import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/screens/cart/contract_screen.dart';
import 'package:furniture_app/utils/color_resources.dart';
import 'package:provider/provider.dart';

import '../../data/cart_model.dart';
import 'cart_item.dart';
import 'custom_item_widget.dart';

class PrintScreen extends StatelessWidget {
  const PrintScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'INV-20',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Cormorant',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            height: 14 / 16,
          ),
        ),
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
        backgroundColor: ColorsResources.PRIMARY_BACKROUND_COLOR,
        actions: [
          Image.asset(
            'assets/icons/edit.png',
            width: 16,
            height: 16,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Consumer<CartModel>(
        builder: ((context, cart, child) {
          return Container(
            color: ColorsResources.PRIMARY_BACKROUND_COLOR,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  // physics: ScrollPhysics(),
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: (constraints.maxHeight)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: cart.cartList.length,
                            itemBuilder: (context, index) {
                              return CartItem(
                                cart: cart.cartList[index],
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            // vertical: 40,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomItemWidget(
                                  startText: 'Цена', endText: '13 890 000 сум'),
                              CustomItemWidget(
                                  startText: 'Скидка', endText: '10%'),
                              CustomItemWidget(
                                  startText: 'Под итог',
                                  endText: '12 501 000 сум'),
                              SizedBox(
                                height: 24,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Итог',
                                    style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 0.9),
                                      fontFamily: 'Roboto',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      height: 16 / 14,
                                    ),
                                  ),
                                  Text(
                                    '12 501 000 сум',
                                    style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 0.8),
                                      fontFamily: 'Roboto',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      height: 19 / 16,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Divider(
                                height: 1,
                                color: Color.fromRGBO(171, 116, 64, 0.9),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              InkWell(
                                // onTap: () {
                                //   Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (_) => CheckoutScreen(),
                                //   ));
                                // },
                                child: Container(
                                  width: double.infinity,
                                  height: 54,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                    width: 1,
                                    color: Color.fromRGBO(171, 116, 64, 0.9),
                                  )),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 24),
                                        color: ColorsResources
                                            .PRIMARY_BACKROUND_COLOR,
                                        height: 54,
                                        child: Center(
                                          child: Text(
                                            'Распечатать',
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 0.9),
                                              fontFamily: 'Roboto',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              height: 16 / 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (_) => ContractScreen(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 24),
                                            height: 54,
                                            color: Color.fromRGBO(
                                                171, 116, 64, 0.9),
                                            child: Center(
                                              child: Text(
                                                'Перейти к договору',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.9),
                                                  fontFamily: 'Roboto',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                  height: 16 / 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
