import 'package:flutter/material.dart';

import '../../../constans.dart';

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
