import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:furniture_app/screens/dashboard_screen.dart';

import '../../utils/color_resources.dart';
import '../../utils/custom_themes.dart';
class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(40),
        color: const Color(0xFF1E1E1E),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Добро пожаловать',
                  style: titleCormorant.copyWith(
                      color: ColorsResources.PRIMARY_COLOR),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Введите одноразовый пароль отправленный на почту',
                  style: titleRegular,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 52,),
                SizedBox(height: 24,),
                Container(
                  height: 44,
                  child: TextFormField(
                    style: titleRegular.copyWith(fontSize: 18),
                    controller: controllerPassword,
                    decoration: InputDecoration(
                      labelText: 'Введите пароль',
                      labelStyle: titleRegular,
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
                    ),
                  ),
                ),
                SizedBox(height: 100),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const DashboardScreen()));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 44,
                    color: Color(0XFFAB7440),
                    child: const Center(
                      child: Text('Войти'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
