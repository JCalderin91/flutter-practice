import 'package:api_rest_app/constans.dart';
import 'package:api_rest_app/presentation/main_binding.dart';
import 'package:api_rest_app/presentation/routes/delivery_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delivery App',
      theme: ThemeData(
        scaffoldBackgroundColor: kSecondaryColor,
        fontFamily: 'Yanone',
        primaryColor: kPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: DeliveryRoutes.splash,
      getPages: DeliveryPages.pages,
      initialBinding: MainBiding(),
    );
  }
}
