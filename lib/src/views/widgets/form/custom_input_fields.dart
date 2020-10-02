import 'package:flutter/material.dart';

class InputFields extends StatelessWidget {
  final Icon prefixIcon;
  final IconButton suffixIcon;
  final String hint;
  final TextInputType textInputType;
  final bool obscure;

  InputFields(this.prefixIcon, this.suffixIcon, this.hint, this.textInputType,
      this.obscure);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      obscureText: this.obscure,
      keyboardType: this.textInputType,
      decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: this.prefixIcon,
          suffixIcon: this.suffixIcon,
          hintText: this.hint,
          hintStyle: TextStyle(color: Colors.white)),
    );
  }
}
