import 'package:api_rest_app/components/custom_text_field.dart';
import 'package:api_rest_app/constans.dart';
import 'package:api_rest_app/presentation/home/componets/best_sellers.dart';
import 'package:api_rest_app/presentation/home/componets/button_navigation.dart';
import 'package:api_rest_app/presentation/home/componets/custom_appbar.dart';
import 'package:api_rest_app/presentation/home/componets/recomended_items.dart';
import 'package:api_rest_app/presentation/home/componets/title_with_more_btn.dart';
import 'package:api_rest_app/presentation/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetWidget<HomeController> {
  final splashController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print('getProducts');
                      },
                      child: Text(
                        'Hola, Jesus!',
                        style: TextStyle(
                          fontSize: 34.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: CustomTextfield(
                  icon: Icon(Icons.search),
                  hint: 'Buscar un servicio',
                ),
              ),
              const SizedBox(height: 10),
              TextWithMoreBtn(title: 'Recomendados', press: () {}),
              RecomendedItems(),
              TextWithMoreBtn(title: 'Mas vendidos', press: () {}),
              BestSellers()
            ],
          ),
        ),
      ),
      bottomNavigationBar: ButtomNavBar(),
    );
  }
}
