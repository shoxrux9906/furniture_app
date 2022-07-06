import 'package:flutter/material.dart';
import 'package:furniture_app/screens/account/commercial_screen.dart';
import 'package:furniture_app/utils/color_resources.dart';

import '../../utils/custom_themes.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  TextEditingController commercialController = TextEditingController();
  TextEditingController contractController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 80,
          elevation: 0,
          backgroundColor: ColorsResources.PRIMARY_BACKROUND_COLOR,
          leading: Image.asset(
            'assets/icons/logotwo.png',
            width: 200,
            height: 80,
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          color: ColorsResources.PRIMARY_BACKROUND_COLOR,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => CommercialScreen(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  width: double.infinity,
                  height: 52,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Color.fromRGBO(171, 116, 64, 0.9),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Коммерческие',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 12 / 14,
                          color: Color.fromRGBO(255, 255, 255, 0.9),
                        ),
                      ),
                      Text(
                        '10',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 12 / 14,
                          color: Color.fromRGBO(255, 255, 255, 0.9),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => CommercialScreen(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  width: double.infinity,
                  height: 52,
                  decoration: BoxDecoration(
                      border: Border.all(
                    width: 1,
                    color: Color.fromRGBO(171, 116, 64, 0.9),
                  )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Договора',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 12 / 14,
                          color: Color.fromRGBO(255, 255, 255, 0.9),
                        ),
                      ),
                      Text(
                        '7',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 12 / 14,
                          color: Color.fromRGBO(255, 255, 255, 0.9),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
