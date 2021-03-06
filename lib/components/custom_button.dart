import 'package:flutter/material.dart';

import '../constans.dart';

class CustomButtom extends StatelessWidget {
  final Function onPressed;
  final Color color;
  final Color textColor;
  final Widget child;
  final double width;
  const CustomButtom({
    Key key,
    @required this.onPressed,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
    @required this.child,
    this.width = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        onPressed: onPressed,
        color: color,
        textColor: textColor,
        padding: const EdgeInsets.symmetric(vertical: 11.0),
        child: child,
      ),
    );
  }
}
