import 'package:flutter/material.dart';

class ResumeField extends StatelessWidget {
  final String initalValue;
  final TextStyle style;
  final bool enable;
  final Icon prefixIcon;
  final Stream<String> stream;
  final Function(String) onChanged;

  ResumeField(this.initalValue, this.style, this.enable, this.prefixIcon,
      this.stream, this.onChanged);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: this.stream,
        builder: (context, snapshot) {
          return TextFormField(
            onChanged: this.onChanged,
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
        });
  }
}
