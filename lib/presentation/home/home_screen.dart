import 'package:api_rest_app/components/custom_text_field.dart';
import 'package:api_rest_app/constans.dart';
import 'package:api_rest_app/presentation/product/product_screen.dart';
import 'package:api_rest_app/size_config.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'componets/title_with_more_btn.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

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

class ButtomNavBar extends StatefulWidget {
  const ButtomNavBar({
    Key key,
  }) : super(key: key);

  @override
  _ButtomNavBarState createState() => _ButtomNavBarState();
}

class _ButtomNavBarState extends State<ButtomNavBar> {
  int _itemSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      height: 60.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -7),
            blurRadius: 33.0,
            color: kPrimaryColor.withOpacity(0.11),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                _itemSelected = 0;
              });
            },
            icon: Icon(
              Icons.home,
              color: _itemSelected == 0 ? kPrimaryColor : Colors.black38,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _itemSelected = 1;
              });
            },
            icon: Icon(
              Icons.notifications,
              color: _itemSelected == 1 ? kPrimaryColor : Colors.black38,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _itemSelected = 2;
              });
            },
            icon: Icon(
              Icons.mail,
              color: _itemSelected == 2 ? kPrimaryColor : Colors.black38,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _itemSelected = 3;
              });
            },
            icon: Icon(
              Icons.people,
              color: _itemSelected == 3 ? kPrimaryColor : Colors.black38,
            ),
          ),
        ],
      ),
    );
  }
}

class BestSellers extends StatelessWidget {
  const BestSellers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8443,
      ),
      itemBuilder: (context, index) {
        return RecomendedItemCard();
      },
    );
  }
}

class RecomendedItems extends StatelessWidget {
  const RecomendedItems({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          RecomendedItemCard(),
          RecomendedItemCard(),
          RecomendedItemCard(),
          RecomendedItemCard(),
          RecomendedItemCard(),
          RecomendedItemCard(),
        ],
      ),
    );
  }
}

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

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleAvatar(
            backgroundColor: kPrimaryColor,
            backgroundImage: AssetImage('assets/images/user.jpg'),
          )
        ],
      ),
    );
  }
}
