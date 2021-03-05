import 'package:api_rest_app/constans.dart';
import 'package:flutter/material.dart';

class TextWithMoreBtn extends StatelessWidget {
  final String title;
  final Function press;
  const TextWithMoreBtn({
    Key key,
    this.title,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: [
          TitleWidthCustomUnderline(text: title),
          Spacer(),
          FlatButton(
            height: 26.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: kPrimaryColor,
            onPressed: press,
            child: Text(
              'Más',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

class TitleWidthCustomUnderline extends StatelessWidget {
  final String text;
  const TitleWidthCustomUnderline({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding / 4),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(right: kDefaultPadding / 4),
              height: 3.0,
              color: kPrimaryColor,
            ),
          )
        ],
      ),
    );
  }
}
