import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_resume_app/constants.dart';
import 'package:my_resume_app/src/blocs/resume_bloc.dart';
import 'package:my_resume_app/src/views/widgets/buttons/custom_rounded_button.dart';
import 'package:my_resume_app/src/views/widgets/custom_divider.dart';
import 'package:my_resume_app/src/views/widgets/form/custom_resume_box.dart';
import 'package:my_resume_app/src/views/widgets/form/custom_text_area.dart';
import 'package:my_resume_app/src/views/widgets/form/custom_text_form_field.dart';
import 'package:my_resume_app/src/views/widgets/navigator/custom_bottom_navigator.dart';

class MyResume extends StatefulWidget {
  final DocumentSnapshot resume;

  MyResume(this.resume);

  @override
  _MyResumeState createState() => _MyResumeState();
}

class _MyResumeState extends State<MyResume> {
  bool _enableField = false;
  final _resumeBloc = ResumeBloc();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RoundedButton(
                                  BackButton(
                                    color: primaryColor,
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BottomNavigator()));
                                    },
                                  ),
                                  50.0,
                                  50.0),
                              Container(
                                child: Row(
                                  children: [
                                    RoundedButton(
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _enableField = true;
                                            });
                                          },
                                          child: Icon(
                                            Icons.edit,
                                            color: primaryColor,
                                          ),
                                        ),
                                        40.0,
                                        40.0),
                                    RoundedButton(
                                        GestureDetector(
                                          onTap: () {
                                            _resumeBloc.editData(widget.resume);
                                            setState(() {
                                              _enableField = false;
                                            });
                                          },
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                        radius: 35.0,
                                        backgroundColor: Colors.black),
                                    SizedBox(
                                      width: 16.0,
                                    ),
                                    Container(
                                        child: Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ResumeField(
                                              "${widget.resume.data['fullName']}",
                                              TextStyle(
                                                  color: buttonColor,
                                                  fontSize: 13.0),
                                              _enableField,
                                              null,
                                              _resumeBloc.outFullName,
                                              _resumeBloc.changeFullName),
                                          ResumeField(
                                              "${widget.resume.data['email']}",
                                              TextStyle(
                                                  color: buttonColor,
                                                  fontSize: 13.0),
                                              _enableField,
                                              Icon(
                                                Icons.email,
                                                color: buttonColor,
                                                size: 16.0,
                                              ),
                                              _resumeBloc.outEmail,
                                              _resumeBloc.changeEmail),
                                          ResumeField(
                                              "${widget.resume.data['phone']}",
                                              TextStyle(
                                                  color: buttonColor,
                                                  fontSize: 13.0),
                                              _enableField,
                                              Icon(
                                                Icons.phone,
                                                color: buttonColor,
                                                size: 16.0,
                                              ),
                                              _resumeBloc.outPhone,
                                              _resumeBloc.changePhone)
                                        ],
                                      ),
                                    )),
                                  ],
                                ),
                                CustomDivider(buttonColor, "Habilidade",
                                    buttonColor, 110.0),
                                Column(
                                  children: [
                                    ResumeField(
                                        "${widget.resume.data['skill']['title']}",
                                        TextStyle(
                                            color: buttonColor, fontSize: 18.0),
                                        _enableField,
                                        Icon(
                                          Icons.circle,
                                          color: buttonColor,
                                          size: 16.0,
                                        ),
                                        _resumeBloc.outSkillTitle,
                                        _resumeBloc.changeSkillTitle),
                                    CustomTextArea(
                                        null,
                                        buttonColor,
                                        "${widget.resume.data['skill']['description']}",
                                        _enableField,
                                        Colors.white,
                                        _resumeBloc.outSkillDescription,
                                        _resumeBloc.changeSkillDescription)
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                CustomDivider(
                                    buttonColor, "Curso", buttonColor, 110.0),
                                Column(
                                  children: [
                                    ResumeField(
                                        "${widget.resume.data['course']['title']}",
                                        TextStyle(
                                            color: buttonColor, fontSize: 18.0),
                                        _enableField,
                                        Icon(
                                          Icons.circle,
                                          color: buttonColor,
                                          size: 16.0,
                                        ),
                                        _resumeBloc.outCourseTitle,
                                        _resumeBloc.changeCourseTitle),
                                    ResumeField(
                                        "${widget.resume.data['course']['date']}",
                                        TextStyle(
                                            color: buttonColor, fontSize: 18.0),
                                        _enableField,
                                        Icon(
                                          Icons.date_range_outlined,
                                          color: buttonColor,
                                          size: 16.0,
                                        ),
                                        _resumeBloc.outCourseDate,
                                        _resumeBloc.changeCourseDate),
                                    ResumeField(
                                        "${widget.resume.data['course']['institute']}",
                                        TextStyle(
                                            color: buttonColor, fontSize: 18.0),
                                        _enableField,
                                        Icon(
                                          Icons.school,
                                          color: buttonColor,
                                          size: 16.0,
                                        ),
                                        _resumeBloc.outCourseInstitute,
                                        _resumeBloc.changeCourseInstitute),
                                  ],
                                ),
                              ],
                            ),
                            25.0,
                            Colors.white)
                      ],
                    ),
                  ),
                );
              default:
                return CircularProgressIndicator();
            }
          }),
    );
  }
}
