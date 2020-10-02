import 'package:flutter/material.dart';
import 'package:my_resume_app/constants.dart';

class CustomButton extends StatelessWidget {
  final String text;

  CustomButton(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      alignment: Alignment.center,
      child: RaisedButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
            decoration: BoxDecoration(
                color: buttonColor, borderRadius: BorderRadius.circular(8.0)),
            child: Container(
              constraints: BoxConstraints(maxWidth: 215.0, minHeight: 60.0),
              alignment: Alignment.center,
              child: Text(
                this.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
            )),
      ),
    );
  }
}
