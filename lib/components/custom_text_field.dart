import 'package:flutter/material.dart';

import '../constans.dart';

class CutomTextfield extends StatelessWidget {
  final String hint;
  final Icon icon;
  const CutomTextfield({
    Key key,
    this.hint,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        decoration: InputDecoration(
            icon: icon,
            border: InputBorder.none,
            hintText: hint,
            hintStyle: TextStyle(
              color: kTextColor.withOpacity(0.7),
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}
