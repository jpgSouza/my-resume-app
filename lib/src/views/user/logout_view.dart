import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          SvgPicture.asset('assets/images/logout.svg'),
          SizedBox(
            height: 40.0,
          ),
          LogoutButton()
        ],
      ),
    );
  }
}
