import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_resume_app/constants.dart';
import 'package:my_resume_app/src/views/auth/register_view.dart';
import 'package:my_resume_app/src/views/widgets/buttons/custom_button.dart';
import 'package:my_resume_app/src/views/widgets/form/custom_box.dart';
import 'package:my_resume_app/src/views/widgets/form/custom_input_fields.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                  child: Container(
                      child:
                          SvgPicture.asset("assets/images/upbackground.svg"))),
              Positioned(
                  bottom: 0.0,
                  child: Container(
                      child: SvgPicture.asset(
                          "assets/images/downbackground.svg"))),
              Positioned(
                  right: 35.0,
                  left: 0.0,
                  top: 80.0,
                  child: Container(
                      alignment: Alignment.topCenter,
                      child: SvgPicture.asset("assets/images/loginlogo.svg"))),
              Positioned(
                  left: 0.0,
                  right: 0.0,
                  bottom: 255.0,
                  child: CustomBox(
                    188.0,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InputFields(
                            Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            null,
                            "E-mail",
                            TextInputType.emailAddress,
                            false,
                            Colors.white),
                        Container(
                            padding: EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.white)))),
                        InputFields(
                            Icon(
                              Icons.vpn_key,
                              color: Colors.white,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.remove_red_eye),
                              color: Colors.white,
                            ),
                            "Senha",
                            TextInputType.text,
                            true,
                            Colors.white),
                        Align(
                          alignment: Alignment.centerRight,
                          child: FlatButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            child: Text(
                              "Esqueceu sua senha?",
                              textAlign: TextAlign.right,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              Positioned(
                right: 0.0,
                left: 0.0,
                bottom: 170.0,
                child: CustomButton("LOGIN"),
              ),
              Positioned(
                  bottom: 140.0,
                  left: 25.0,
                  right: 25.0,
                  child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          color: primaryColor,
                          width: 145,
                          height: 1,
                        ),
                        Text(
                          "OU",
                          style: TextStyle(color: secondaryColor),
                        ),
                        Container(
                          color: primaryColor,
                          width: 145,
                          height: 1,
                        ),
                      ],
                    ),
                  )),
              Positioned(
                  bottom: 80.0,
                  left: 75.0,
                  right: 75.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 52.0,
                        height: 52.0,
                        alignment: Alignment.center,
                        child: GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                                "assets/icons/facebooksignin.svg",
                                fit: BoxFit.fill)),
                      ),
                      Container(
                        width: 52.0,
                        height: 52.0,
                        alignment: Alignment.center,
                        child: GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                                "assets/icons/googlesignin.svg",
                                fit: BoxFit.fill)),
                      )
                    ],
                  )),
              Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 20.0,
                child: Align(
                    alignment: Alignment.center,
                    child: FlatButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => RegisterView()));
                        },
                        padding: EdgeInsets.zero,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Não possui conta?",
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(
                              width: 6.0,
                            ),
                            Text("Cadastre-se",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}