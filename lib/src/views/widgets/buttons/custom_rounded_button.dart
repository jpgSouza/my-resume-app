import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  Widget widget;
  final double height;
  final double width;
  RoundedButton(this.widget, this.height, this.width);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30.0),
      width: this.width,
      height: this.height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black26, blurRadius: 10.0, offset: Offset(5, 5))
          ]),
      child: this.widget,
    );
  }
}
