import 'package:flutter/material.dart';

class CustomTextArea extends StatelessWidget {
  final String hint;
  final Color color;
  final Color textColor;
  final String initialValue;

  CustomTextArea(this.hint, this.color, this.initialValue, this.textColor);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: this.color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: TextFormField(
          style: TextStyle(color: this.textColor),
          initialValue: this.initialValue,
          maxLines: 3,
          decoration: InputDecoration.collapsed(
              hintText: this.hint, fillColor: Colors.grey[500]),
        ),
      ),
    );
  }
}
