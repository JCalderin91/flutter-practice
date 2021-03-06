import 'package:flutter/material.dart';

import '../constans.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final Icon icon;
  const CustomTextfield({
    Key key,
    this.hint,
    this.icon,
    this.controller,
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
        controller: controller,
        decoration: InputDecoration(
          icon: icon,
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(
            color: kTextColor.withOpacity(0.7),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
