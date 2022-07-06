import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/data/auth_provider.dart';
import 'package:furniture_app/screens/auth/otp_screen.dart';
import 'package:furniture_app/utils/color_resources.dart';
import 'package:furniture_app/utils/custom_themes.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  final langList = [
    'RU',
    'UZ',
    'ENG',
    'TUR',
  ];

  var activeLang = false;

  var isChecked = false;
  var isLoading = false;
  var isVal = false;

  bool isValid() {
    if (controllerEmail.text.isEmpty || controllerPassword.text.isEmpty) {
      isVal = false;
      return isVal;
    } else {
      isVal = true;
      return isVal;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(40),
        color: const Color(0xFF1E1E1E),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 44,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: langList
                    .map(
                      (e) => Container(
                        width: 54,
                        decoration: BoxDecoration(
                            border: Border.all(
                          width: 1,
                          color: ColorsResources.PRIMARY_COLOR,
                        )),
                        child: Center(
                          child: Text(
                            e,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 12 / 14,
                              color: Color.fromRGBO(255, 255, 255, 0.5),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Добро пожаловать',
                      style: titleCormorant.copyWith(
                          color: ColorsResources.PRIMARY_COLOR),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Войдите в свой аккаунт',
                      style: titleRegular,
                    ),
                    SizedBox(
                      height: 72,
                    ),
                    Container(
                      height: 44,
                      child: TextFormField(
                        style: titleRegular.copyWith(fontSize: 18),
                        controller: controllerEmail,
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
                          labelText: 'Введите E-mail',
                          labelStyle: titleRegular,
                          hintStyle: titleRegular,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
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
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Theme(
                          data: Theme.of(context).copyWith(
                            unselectedWidgetColor: ColorsResources.PRIMARY_COLOR,
                            backgroundColor: ColorsResources.PRIMARY_COLOR,
                          ),
                          child: Checkbox(
                              value: isChecked,
                              checkColor: ColorsResources.PRIMARY_BACKROUND_COLOR,
                              onChanged: (bool? val) {
                                setState(() {
                                  isChecked = val!;
                                });
                              }),
                        ),
                        Text(
                          'Запомнить меня',
                          style: titleRegular,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          isLoading = true;
                        });
                        await Provider.of<AuthProvider>(context, listen: false)
                            .signin(
                          controllerEmail.text.trim(),
                          controllerPassword.text.trim(),
                        );
                        setState(() {
                          isLoading = false;
                        });
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => const OtpScreen()));
                      },
                      child: Container(
                        width: double.infinity,
                        height: 44,
                        color: Color.fromRGBO(171, 116, 64, 0.9),
                        child: const Center(
                          child: Text('Войти'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
