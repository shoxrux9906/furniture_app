import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/color_resources.dart';

class CommercialScreen extends StatefulWidget {
  const CommercialScreen({Key? key}) : super(key: key);

  @override
  State<CommercialScreen> createState() => _CommercialScreenState();
}

class _CommercialScreenState extends State<CommercialScreen> {
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
        padding: EdgeInsets.all(20),
        color: ColorsResources.PRIMARY_BACKROUND_COLOR,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.only(bottom: 30),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Color.fromRGBO(171, 116, 64, 0.9),
              ),
              borderRadius: BorderRadius.circular(5)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'INV-2$index',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 12 / 14,
                    color: Color.fromRGBO(255, 255, 255, 0.9),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Divider(
                  height: 1,
                  color: Color.fromRGBO(171, 116, 64, 0.9),
                ),
                SizedBox(
                  height: 10,
                ),

                Text(
                  'Иванов Иван Иванович',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 12 / 14,
                    color: Color.fromRGBO(255, 255, 255, 0.9),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Divider(
                  height: 1,
                  color: Color.fromRGBO(171, 116, 64, 0.9),
                ),
                SizedBox(
                  height: 10,
                ),

                Text(
                  '15 390 210 сум',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 12 / 14,
                    color: Color.fromRGBO(255, 255, 255, 0.9),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Divider(
                  height: 1,
                  color: Color.fromRGBO(171, 116, 64, 0.9),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '05.06.2022',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    height: 10 / 12,
                    color: Color.fromRGBO(255, 255, 255, 0.5),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
