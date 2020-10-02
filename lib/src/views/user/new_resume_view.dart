import 'package:flutter/material.dart';
import 'package:my_resume_app/constants.dart';
import 'package:my_resume_app/src/views/widgets/buttons/custom_button.dart';
import 'package:my_resume_app/src/views/widgets/form/custom_box.dart';
import 'package:my_resume_app/src/views/widgets/form/custom_input_fields.dart';
import 'package:my_resume_app/src/views/widgets/form/custom_text_area.dart';

class NewResume extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 15.0, bottom: 8.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              color: buttonColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    onPressed: () {},
                    child: CircleAvatar(
                      radius: 35.0,
                      backgroundColor: Colors.black,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 50.0),
                      child: Column(
                        children: [
                          InputFields(
                              Icon(Icons.picture_as_pdf_rounded,
                                  color: Colors.white),
                              null,
                              "Nome do arquivo",
                              TextInputType.text,
                              false,
                              Colors.white),
                          Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.white)))),
                        ],
                      )),
                ],
              ),
            ),
            CustomBox(
                580.0,
                Column(
                  children: [
                    Text("Perfil", style: TextStyle(color: Colors.white)),
                    InputFields(
                        Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        null,
                        "Nome completo",
                        TextInputType.text,
                        false,
                        Colors.white),
                    Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.white)))),
                    InputFields(
                        Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        null,
                        "Telefone",
                        TextInputType.number,
                        false,
                        Colors.white),
                    Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.white)))),
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
                        margin: EdgeInsets.only(bottom: 10.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.white)))),
                    Text("Habilidades",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    InputFields(
                        Icon(
                          Icons.title_rounded,
                          color: Colors.white,
                        ),
                        null,
                        "Titulo",
                        TextInputType.text,
                        false,
                        Colors.white),
                    Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.white)))),
                    CustomTextArea(),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Curso",
                      style: TextStyle(color: Colors.white),
                    ),
                    InputFields(
                        Icon(
                          Icons.auto_stories,
                          color: Colors.white,
                        ),
                        null,
                        "Titulo do curso",
                        TextInputType.text,
                        false,
                        Colors.white),
                    Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.white)))),
                    InputFields(
                        Icon(
                          Icons.date_range_outlined,
                          color: Colors.white,
                        ),
                        null,
                        "Data de inicio",
                        TextInputType.datetime,
                        false,
                        Colors.white),
                    Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.white)))),
                    InputFields(
                        Icon(
                          Icons.school,
                          color: Colors.white,
                        ),
                        null,
                        "Instituição",
                        TextInputType.datetime,
                        false,
                        Colors.white),
                  ],
                ),
                25.0),
            CustomButton("CRIAR"),
            SizedBox(
              height: 25.0,
            )
          ],
        ),
      )),
    );
  }
}
