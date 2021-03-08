import 'package:api_rest_app/components/custom_text_field.dart';
import 'package:api_rest_app/constans.dart';
import 'package:api_rest_app/presentation/home/componets/button_navigation.dart';
import 'package:api_rest_app/presentation/home/componets/custom_appbar.dart';
import 'package:api_rest_app/presentation/home/componets/recomended_card.dart';
import 'package:api_rest_app/presentation/home/componets/title_with_more_btn.dart';
import 'package:api_rest_app/presentation/home/home_controller.dart';
import 'package:api_rest_app/presentation/routes/delivery_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetWidget<HomeController> {
  Future<void> logout() async {
    await controller.logout();
    Get.offAllNamed(DeliveryRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(press: logout),
              Container(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hola, Jesus!',
                      style: TextStyle(
                        fontSize: 34.0,
                        fontWeight: FontWeight.bold,
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
              Obx(() => controller.productList.isNotEmpty
                  ? Container(
                      height: 242.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: controller.productList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final product = controller.productList[index];
                          return RecomendedItemCard(product: product);
                        },
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    )),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ButtomNavBar(),
    );
  }
}
