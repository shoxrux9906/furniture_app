import 'package:flutter/material.dart';
import 'package:furniture_app/utils/color_resources.dart';

import '../../data/product.dart';

class HeroAnimationScreen extends StatefulWidget {
  final Product product;

  const HeroAnimationScreen({Key? key, required this.product})
      : super(key: key);

  @override
  State<HeroAnimationScreen> createState() => _HeroAnimationScreenState();
}

class _HeroAnimationScreenState extends State<HeroAnimationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsResources.PRIMARY_BACKROUND_COLOR,
        elevation: 0,
        leading: Container(),
        leadingWidth: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.cancel,
              color: Colors.white,
              size: 40,
            ),
          ),
          SizedBox(
            width: 12,
          ),
        ],
      ),
      body: Container(
        color: ColorsResources.PRIMARY_BACKROUND_COLOR,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: "heroOne",
              child: Container(
                color: Colors.white,
                child: Image.asset(
                  '${widget.product.image}',
                  width: double.infinity,
                  height: 307,
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              '${widget.product.name}',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            // ElevatedButton(
            //   child: Text('Back to first screen!'),
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            // ),
          ],
        )),
      ),
    );
  }
}
