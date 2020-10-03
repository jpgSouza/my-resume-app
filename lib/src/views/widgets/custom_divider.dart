import 'package:flutter/material.dart';

import '../../../constants.dart';

class CustomDivider extends StatelessWidget {
  final Color color;
  final String text;
  final Color textColor;

  CustomDivider(this.color, this.text, this.textColor);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          color: this.color,
          width: 145,
          height: 1,
        ),
        Text(
          this.text,
          style: TextStyle(color: this.textColor),
        ),
        Container(
          color: this.color,
          width: 145,
          height: 1,
        ),
      ],
    );
  }
}
