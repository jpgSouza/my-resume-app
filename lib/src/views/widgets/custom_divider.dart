import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final Color color;
  final String text;
  final Color textColor;

  final double width;

  CustomDivider(this.color, this.text, this.textColor, this.width);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          color: this.color,
          width: this.width,
          height: 1,
        ),
        Text(
          this.text,
          style: TextStyle(color: this.textColor),
        ),
        Container(
          color: this.color,
          width: this.width,
          height: 1,
        ),
      ],
    );
  }
}
