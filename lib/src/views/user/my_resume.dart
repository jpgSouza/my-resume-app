import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_resume_app/constants.dart';
import 'package:my_resume_app/src/views/widgets/buttons/custom_rounded_button.dart';
import 'package:my_resume_app/src/views/widgets/custom_divider.dart';
import 'package:my_resume_app/src/views/widgets/form/custom_resume_box.dart';
import 'package:my_resume_app/src/views/widgets/form/custom_text_area.dart';
import 'package:my_resume_app/src/views/widgets/form/custom_text_form_field.dart';
import 'package:my_resume_app/src/views/widgets/navigator/custom_bottom_navigator.dart';

class MyResume extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(color: buttonColor, boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8.0,
                      offset: Offset(1.5, 8.0))
                ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RoundedButton(
                        BackButton(
                          color: primaryColor,
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => BottomNavigator()));
                          },
                        ),
                        50.0,
                        50.0),
                    Container(
                      child: Row(
                        children: [
                          RoundedButton(
                              GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  Icons.edit,
                                  color: primaryColor,
                                ),
                              ),
                              40.0,
                              40.0),
                          RoundedButton(
                              GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  Icons.save,
                                  color: primaryColor,
                                ),
                              ),
                              40.0,
                              40.0),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              ResumeBox(
                  null,
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                              radius: 35.0, backgroundColor: Colors.black),
                          SizedBox(
                            width: 16.0,
                          ),
                          Container(
                              child: Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ResumeField(
                                    "João Pedro Giacometti de Souza",
                                    TextStyle(
                                        color: buttonColor, fontSize: 13.0),
                                    false,
                                    null),
                                ResumeField(
                                    "joaopedro@gmail.com",
                                    TextStyle(
                                        color: buttonColor, fontSize: 13.0),
                                    false,
                                    Icon(
                                      Icons.email,
                                      color: buttonColor,
                                      size: 16.0,
                                    )),
                                ResumeField(
                                    "(35)99976-0853",
                                    TextStyle(
                                        color: buttonColor, fontSize: 13.0),
                                    false,
                                    Icon(
                                      Icons.phone,
                                      color: buttonColor,
                                      size: 16.0,
                                    ))
                              ],
                            ),
                          )),
                        ],
                      ),
                      CustomDivider(
                          buttonColor, "Habilidade", buttonColor, 110.0),
                      Column(
                        children: [
                          ResumeField(
                              "Java",
                              TextStyle(color: buttonColor, fontSize: 18.0),
                              false,
                              Icon(
                                Icons.circle,
                                color: buttonColor,
                                size: 16.0,
                              )),
                          CustomTextArea(
                              null,
                              buttonColor,
                              "Experiência com Framework Spring Boot e criação de aplicações Backend com API REST.",
                              Colors.white)
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      CustomDivider(buttonColor, "Curso", buttonColor, 110.0),
                      Column(
                        children: [
                          ResumeField(
                              "Java completo 2020",
                              TextStyle(color: buttonColor, fontSize: 18.0),
                              false,
                              Icon(
                                Icons.circle,
                                color: buttonColor,
                                size: 16.0,
                              )),
                          ResumeField(
                              "10/06/2020",
                              TextStyle(color: buttonColor, fontSize: 18.0),
                              false,
                              Icon(
                                Icons.date_range_outlined,
                                color: buttonColor,
                                size: 16.0,
                              )),
                          ResumeField(
                              "Udemy",
                              TextStyle(color: buttonColor, fontSize: 18.0),
                              false,
                              Icon(
                                Icons.school,
                                color: buttonColor,
                                size: 16.0,
                              )),
                        ],
                      ),
                    ],
                  ),
                  25.0,
                  Colors.white)
            ],
          ),
        ),
      ),
    );
  }
}
