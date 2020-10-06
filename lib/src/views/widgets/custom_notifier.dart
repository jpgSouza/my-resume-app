import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_resume_app/constants.dart';

class CustomNotifier extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30.0),
      color: Colors.white,
      alignment: Alignment.center,
      child: Column(
        children: [
          SvgPicture.asset('assets/images/no_data.svg'),
          SizedBox(
            height: 50.0,
          ),
          Text(
            "Nenhum curriculo cadastrado",
            style: TextStyle(color: buttonColor, fontSize: 16.0),
          )
        ],
      ),
    );
  }
}
