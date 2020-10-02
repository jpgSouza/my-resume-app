import 'package:flutter/material.dart';

class CustomTextArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: TextField(
          maxLines: 3,
          decoration: InputDecoration.collapsed(
              hintText: "Resumo", fillColor: Colors.grey[500]),
        ),
      ),
    );
  }
}
