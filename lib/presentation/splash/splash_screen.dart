import 'package:api_rest_app/constans.dart';
import 'package:api_rest_app/presentation/splash/splash_controller.dart';
import 'package:api_rest_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetWidget<SplashController> {
  final splashController = Get.find<SplashController>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/food-delivery.png",
                  width: 90,
                ),
                const SizedBox(height: 20),
                Text(
                  'Delivery App',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 6.0,
            right: 6.0,
            child: Center(child: Text('V1.0')),
          )
        ],
      ),
    );
  }
}
