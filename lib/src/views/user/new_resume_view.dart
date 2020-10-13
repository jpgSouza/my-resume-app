import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_resume_app/constants.dart';
import 'package:my_resume_app/masks.dart';
import 'package:my_resume_app/src/blocs/resume_bloc.dart';
import 'package:my_resume_app/src/views/widgets/form/custom_box.dart';
import 'package:my_resume_app/src/views/widgets/form/custom_input_fields.dart';
import 'package:my_resume_app/src/views/widgets/form/custom_text_area.dart';
import 'package:my_resume_app/src/views/widgets/image_source_sheet.dart';
import 'package:my_resume_app/src/views/widgets/navigator/custom_bottom_navigator.dart';

class NewResume extends StatefulWidget {
  @override
  _NewResumeState createState() => _NewResumeState();
}

class _NewResumeState extends State<NewResume> {
  final _resumeBloc = ResumeBloc();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  File _image;
  @override
  void initState() {
    super.initState();

    _resumeBloc.outState.listen((state) {
      switch (state) {
        case ResumeState.SUCCESS:
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => BottomNavigator()));
          break;
        case ResumeState.FAIL:
        case ResumeState.LOADING:
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text(
              "Cadastrado com sucesso!",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            elevation: 6.0,
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ));
          break;
        case ResumeState.IDLE:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: StreamBuilder<ResumeState>(
          stream: _resumeBloc.outState,
          builder: (context, snapshot) {
            switch (snapshot.data) {
              case ResumeState.LOADING:
                return Center(child: CircularProgressIndicator());
              case ResumeState.SUCCESS:
              case ResumeState.FAIL:
              case ResumeState.IDLE:
                return SafeArea(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 15.0, bottom: 8.0),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                            color: buttonColor,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 8.0,
                                  offset: Offset(1.5, 8.0))
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlatButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) => ImageSourceSheet(
                                          onImageSelected: (image) {
                                            setState(() {
                                              this._image = image;
                                            });
                                          },
                                        ));
                              },
                              child: CircleAvatar(
                                  radius: 35.0,
                                  backgroundImage: this._image == null
                                      ? AssetImage(
                                          'assets/images/profile-pic.png')
                                      : FileImage(this._image)),
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
                                        Colors.white,
                                        _resumeBloc.outTitle,
                                        _resumeBloc.changeTitle,
                                        null),
                                    Container(
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.white)))),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      CustomBox(
                          null,
                          Column(
                            children: [
                              Text("Perfil",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              InputFields(
                                  Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                  null,
                                  "Nome completo",
                                  TextInputType.text,
                                  false,
                                  Colors.white,
                                  _resumeBloc.outFullName,
                                  _resumeBloc.changeFullName,
                                  null),
                              Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                color: Colors.white,
                              )))),
                              InputFields(
                                  Icon(
                                    Icons.phone,
                                    color: Colors.white,
                                  ),
                                  null,
                                  "Telefone",
                                  TextInputType.number,
                                  false,
                                  Colors.white,
                                  _resumeBloc.outPhone,
                                  _resumeBloc.changePhone,
                                  MaskFormat.phoneMask()),
                              Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.white)))),
                              InputFields(
                                  Icon(
                                    Icons.email,
                                    color: Colors.white,
                                  ),
                                  null,
                                  "E-mail",
                                  TextInputType.emailAddress,
                                  false,
                                  Colors.white,
                                  _resumeBloc.outEmail,
                                  _resumeBloc.changeEmail,
                                  null),
                              Container(
                                  margin: EdgeInsets.only(bottom: 10.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.white)))),
                              Text("Habilidades",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              InputFields(
                                  Icon(
                                    Icons.title_rounded,
                                    color: Colors.white,
                                  ),
                                  null,
                                  "Titulo",
                                  TextInputType.text,
                                  false,
                                  Colors.white,
                                  _resumeBloc.outSkillTitle,
                                  _resumeBloc.changeSkillTitle,
                                  null),
                              Container(
                                  margin: EdgeInsets.only(bottom: 10.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.white)))),
                              CustomTextArea(
                                  "Resumo",
                                  Colors.white,
                                  null,
                                  true,
                                  Colors.black,
                                  _resumeBloc.outSkillDescription,
                                  _resumeBloc.changeSkillDescription),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "Curso",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
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
                                  Colors.white,
                                  _resumeBloc.outCourseTitle,
                                  _resumeBloc.changeCourseTitle,
                                  null),
                              Container(
                                  margin: EdgeInsets.only(bottom: 10.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.white)))),
                              InputFields(
                                  Icon(
                                    Icons.date_range_outlined,
                                    color: Colors.white,
                                  ),
                                  null,
                                  "Data de inicio",
                                  TextInputType.datetime,
                                  false,
                                  Colors.white,
                                  _resumeBloc.outCourseDate,
                                  _resumeBloc.changeCourseDate,
                                  MaskFormat.dateMask()),
                              Container(
                                  margin: EdgeInsets.only(bottom: 10.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.white)))),
                              InputFields(
                                  Icon(
                                    Icons.school,
                                    color: Colors.white,
                                  ),
                                  null,
                                  "Instituição",
                                  TextInputType.text,
                                  false,
                                  Colors.white,
                                  _resumeBloc.outCourseInstitute,
                                  _resumeBloc.changeCourseInstitute,
                                  null),
                            ],
                          ),
                          25.0,
                          primaryColor),
                      Container(
                        height: 55.0,
                        alignment: Alignment.center,
                        child: RaisedButton(
                          onPressed: () {
                            _resumeBloc.createResume(this._image);
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                              decoration: BoxDecoration(
                                  color: buttonColor,
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: Container(
                                constraints: BoxConstraints(
                                    maxWidth: 215.0, minHeight: 60.0),
                                alignment: Alignment.center,
                                child: Text(
                                  "CRIAR",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                  ),
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      )
                    ],
                  ),
                ));
              default:
                return CircularProgressIndicator();
            }
          }),
    );
  }
}
