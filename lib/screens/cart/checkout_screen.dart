import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/screens/cart/submit_commercial_screen.dart';

import '../../utils/color_resources.dart';
import '../../utils/custom_themes.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController discountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(20),
        color: ColorsResources.PRIMARY_BACKROUND_COLOR,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Клиент',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      height: 12 / 14,
                      color: Color.fromRGBO(255, 255, 255, 0.5),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  customTextFormField(phoneNumberController, 'Номер телефона'),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Клиент',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      height: 12 / 14,
                      color: Color.fromRGBO(255, 255, 255, 0.5),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  customTextFormField(fullNameController, 'Ф.И.О'),
                  SizedBox(
                    height: 20,
                  ),
                  customTextFormField(phoneNumberController, 'Номер'),
                  SizedBox(
                    height: 20,
                  ),
                  customTextFormField(addressController, 'Адрес'),
                  SizedBox(
                    height: 20,
                  ),
                  customTextFormField(discountController, 'Скидка 10%'),
                  SizedBox(height: 24,),
                  Spacer(),
                  Container(
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
                              builder: (_) => SubmitCommercialScreen(),
                            ));
                          },
                          child: Container(
                            width: double.infinity,
                            height: 54,
                            color: Color.fromRGBO(171, 116, 64, 0.9),
                            child: const Center(
                              child: Text('Оформить заказ'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],

        ),
      ),
    );
  }

  Widget customTextFormField(
      TextEditingController controller, String labelText) {
    return Container(
      height: 52,
      child: TextFormField(
        style: titleRegular.copyWith(fontSize: 18),
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Color.fromRGBO(171, 116, 64, 0.9),
            ),
            borderRadius: BorderRadius.circular(0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: ColorsResources.PRIMARY_COLOR,
            ),
            borderRadius: BorderRadius.circular(0),
          ),
          labelText: '$labelText',
          labelStyle: titleRegular,
          hintStyle: titleRegular,
        ),
      ),
    );
  }
}
