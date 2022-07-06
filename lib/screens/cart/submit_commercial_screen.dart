import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/screens/cart/print_screen.dart';
import 'package:furniture_app/utils/color_resources.dart';

import 'custom_item_widget.dart';

class SubmitCommercialScreen extends StatelessWidget {
  const SubmitCommercialScreen({Key? key}) : super(key: key);

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
        color: ColorsResources.PRIMARY_BACKROUND_COLOR,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CustomItemWidget(startText: 'Цена', endText: '13 890 000 сум'),
            CustomItemWidget(startText: 'Скидка', endText: '10%'),
            CustomItemWidget(startText: 'Под итог', endText: '12 501 000 сум'),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => PrintScreen(),
                ));
              },
              child: Container(
                width: double.infinity,
                height: 54,
                color: Color.fromRGBO(171, 116, 64, 0.9),
                child: const Center(
                  child: Text('Подать коммерческое'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
