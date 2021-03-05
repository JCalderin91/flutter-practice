import 'package:api_rest_app/constans.dart';
import 'package:api_rest_app/presentation/product/product_screen.dart';
import 'package:api_rest_app/size_config.dart';
import 'package:flutter/material.dart';

class RecomendedItemCard extends StatelessWidget {
  const RecomendedItemCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          left: kDefaultPadding,
          right: kDefaultPadding,
          top: kDefaultPadding / 2,
          bottom: kDefaultPadding,
        ),
        width: SizeConfig.screenWidth * 0.4,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5.0),
                topRight: Radius.circular(5.0),
              ),
              child: Image.asset('assets/images/item.jpg'),
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
                        text: 'Sopa\n'.toUpperCase(),
                        style: TextStyle(
                          color: kTextColor,
                        ),
                      ),
                      TextSpan(
                          text: 'Comida',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: kPrimaryColor.withOpacity(0.5),
                          ))
                    ]),
                  ),
                  Text(
                    '\$440',
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
