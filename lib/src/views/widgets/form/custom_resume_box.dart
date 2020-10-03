import 'package:flutter/material.dart';

class ResumeBox extends StatelessWidget {
  final double height;
  final Widget widget;
  final double vertical;
  final Color color;

  ResumeBox(this.height, this.widget, this.vertical, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: this.vertical),
        padding:
            EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0, bottom: 10.0),
        width: 369.0,
        height: this.height,
        decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.circular(6.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black26, blurRadius: 16.0, offset: Offset(4, 8))
          ],
        ),
        child: this.widget);
  }
}
