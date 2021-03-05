import 'package:api_rest_app/constans.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Function press;
  const CustomAppBar({
    Key key,
    this.press,
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
          GestureDetector(
            onDoubleTap: press,
            child: CircleAvatar(
              backgroundColor: kPrimaryColor,
              backgroundImage: AssetImage('assets/images/user.jpg'),
            ),
          )
        ],
      ),
    );
  }
}
