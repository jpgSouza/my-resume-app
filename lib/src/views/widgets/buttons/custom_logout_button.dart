import 'package:flutter/material.dart';
import 'package:my_resume_app/constants.dart';

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      alignment: Alignment.center,
      child: Container(
        constraints: BoxConstraints(maxWidth: 350.0, minHeight: 60.0),
        child: OutlineButton(
            padding: EdgeInsets.only(left: 40.0, right: 40.0),
            color: buttonColor,
            child: Tab(
              icon: Container(
                  child: Text(
                "SAIR",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: buttonColor,
                ),
              )),
            ),
            borderSide: BorderSide(color: buttonColor, width: 2),
            shape: StadiumBorder(),
            onPressed: () {}),
      ),
    );
  }
}
