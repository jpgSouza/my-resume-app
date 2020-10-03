import 'package:flutter/material.dart';

class ResumeField extends StatelessWidget {
  final String initalValue;
  final TextStyle style;
  final bool enable;
  final Icon prefixIcon;

  ResumeField(this.initalValue, this.style, this.enable, this.prefixIcon);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      enabled: this.enable,
      style: this.style,
      initialValue: this.initalValue,
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        prefixIcon: this.prefixIcon,
      ),
    );
  }
}
