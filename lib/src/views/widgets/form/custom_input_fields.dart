import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputFields extends StatelessWidget {
  final Icon prefixIcon;
  final IconButton suffixIcon;
  final String hint;
  final TextInputType textInputType;
  final bool obscure;
  final Color color;
  final Stream<String> stream;
  final Function(String) onChanged;
  final MaskTextInputFormatter mask;

  InputFields(this.prefixIcon, this.suffixIcon, this.hint, this.textInputType,
      this.obscure, this.color, this.stream, this.onChanged, this.mask);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: this.stream,
        builder: (context, snapshot) {
          return TextFormField(
            onChanged: onChanged,
            style: TextStyle(color: this.color),
            obscureText: this.obscure,
            keyboardType: this.textInputType,
            inputFormatters: [this.mask],
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: this.prefixIcon,
                suffixIcon: this.suffixIcon,
                hintText: this.hint,
                hintStyle: TextStyle(color: this.color),
                errorText: snapshot.hasError ? snapshot.error : null),
          );
        });
  }
}
