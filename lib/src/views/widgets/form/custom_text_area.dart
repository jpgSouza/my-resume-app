import 'package:flutter/material.dart';

class CustomTextArea extends StatelessWidget {
  final String hint;
  final Color color;
  final Color textColor;
  final String initialValue;
  final Stream<String> stream;
  final Function(String) onChanged;

  CustomTextArea(this.hint, this.color, this.initialValue, this.textColor,
      this.stream, this.onChanged);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: this.stream,
        builder: (context, snapshot) {
          return Card(
            color: this.color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: this.onChanged,
                style: TextStyle(color: this.textColor),
                initialValue: this.initialValue,
                maxLines: 3,
                maxLength: 80,
                decoration: InputDecoration.collapsed(
                    hintText: this.hint, fillColor: Colors.grey[500]),
              ),
            ),
          );
        });
  }
}
