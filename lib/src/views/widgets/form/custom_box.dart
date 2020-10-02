import 'package:flutter/material.dart';
import 'package:my_resume_app/constants.dart';

class LoginBox extends StatelessWidget {
  final double height;
  final Widget widget;

  LoginBox(this.height, this.widget);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 25.0),
        padding:
            EdgeInsets.only(left: 30.0, right: 30.0, top: 25.0, bottom: 10.0),
        width: 369.0,
        height: this.height,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(6.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black26, blurRadius: 10.0, offset: Offset(8, 15))
          ],
        ),
        child: this.widget);
  }
}
