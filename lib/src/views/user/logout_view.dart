import 'package:flutter/material.dart';
import 'package:my_resume_app/src/views/widgets/buttons/custom_logout_button.dart';

class LogoutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Deseja sair do aplicativo?",
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(
            height: 40.0,
          ),
          LogoutButton()
        ],
      ),
    );
  }
}
