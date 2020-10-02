import 'package:flutter/material.dart';

class InputFields extends StatelessWidget {
  final Icon prefixIcon;
  final IconButton suffixIcon;
  final String hint;
  final TextInputType textInputType;
  final bool obscure;
  final Color color;

  InputFields(this.prefixIcon, this.suffixIcon, this.hint, this.textInputType,
      this.obscure, this.color);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: this.color),
      obscureText: this.obscure,
      keyboardType: this.textInputType,
      decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: this.prefixIcon,
          suffixIcon: this.suffixIcon,
          hintText: this.hint,
          hintStyle: TextStyle(color: this.color)),
    );
  }
}
