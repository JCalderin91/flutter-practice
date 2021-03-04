import 'package:api_rest_app/constans.dart';
import 'package:api_rest_app/pages/login/login_screen.dart';
import 'package:api_rest_app/size_config.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        color: kPrimaryColor.withOpacity(0.3),
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          // onVerticalDragUpdate: (details) {
          //   if (details.delta.dy < 0) {
          //     print('Delizar hacia arriba');
          //   } else {
          //     print('Delizar hacia abajo');
          //   }
          // },
          onTap: () {
            // Navigator.pushAndRemoveUntil
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
            );
          },
          child: Center(
            child: Image.asset(
              "assets/images/food-delivery.png",
              width: SizeConfig.screenWidth * 0.50,
            ),
          ),
        ),
      ),
    );
  }
}
