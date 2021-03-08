import 'package:api_rest_app/constans.dart';
import 'package:api_rest_app/domain/models/product_model.dart';
import 'package:api_rest_app/presentation/home/home_controller.dart';
import 'package:api_rest_app/presentation/routes/delivery_navigation.dart';
import 'package:api_rest_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecomendedItemCard extends StatelessWidget {
  final controller = Get.find<HomeController>();
  final ProductModel product;
  RecomendedItemCard({
    Key key,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return GestureDetector(
      onTap: () {
        controller.selectProduct(product);
        Get.toNamed(DeliveryRoutes.product);
      },
      child: Container(
        margin: EdgeInsets.only(
          left: kDefaultPadding,
          right: kDefaultPadding,
          top: kDefaultPadding / 2,
          bottom: kDefaultPadding,
        ),
        width: SizeConfig.screenWidth * 0.6,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5.0),
                topRight: Radius.circular(5.0),
              ),
              child: Container(
                // padding: EdgeInsets.all(24),
                color: Colors.white,
                // child: Hero(
                //   tag: product.id,
                //   child: Image.asset(
                //     'assets/images/food-delivery.png',
                //   ),
                // ),
                child: Hero(
                  tag: product.id,
                  child: Image.network(
                    product.image,
                  ),
                ),
              ),
              // child: Image.network(
              //   product.image,
              // ),
            ),
            Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5.0),
                  bottomRight: Radius.circular(5.0),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 20,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Poducto\n'.toUpperCase(),
                        style: TextStyle(
                          color: kTextColor,
                        ),
                      ),
                      TextSpan(
                          text: '${product.stock}',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: kPrimaryColor.withOpacity(0.5),
                          ))
                    ]),
                  ),
                  Text(
                    '\$${product.price}',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 16.0,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
