import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_resume_app/constants.dart';
import 'package:my_resume_app/src/blocs/resume_bloc.dart';
import 'package:my_resume_app/src/views/user/my_resume.dart';

class ResumeTile extends StatelessWidget {
  final DocumentSnapshot resume;

  ResumeTile(this.resume);

  @override
  Widget build(BuildContext context) {
    final _resumeBloc = BlocProvider.of<ResumeBloc>(context);
    return Container(
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 6.0,
        color: Colors.white,
        child: Container(
          padding:
              EdgeInsets.only(left: 20.0, right: 16.0, top: 10.0, bottom: 10.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundColor: Colors.black,
              ),
              SizedBox(
                width: 22.0,
              ),
              Container(
                height: 73.0,
                width: 1.0,
                color: buttonColor,
              ),
              SizedBox(
                width: 12.0,
              ),
              Container(
                child: Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "${resume.documentID}",
                          ),
                          Icon(
                            Icons.share,
                            color: primaryColor,
                            size: 28.0,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Container(
                        width: 170.0,
                        height: 45.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 10.0,
                                  offset: Offset(0, 6))
                            ]),
                        child: Row(
                          children: <Widget>[
                            Container(
                                alignment: Alignment.center,
                                width: 85.0,
                                height: 45.0,
                                decoration: BoxDecoration(
                                    color: buttonColor,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(6.0),
                                        bottomLeft: Radius.circular(6.0))),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MyResume(resume)));
                                  },
                                  child: Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.white,
                                  ),
                                )),
                            Container(
                                alignment: Alignment.center,
                                width: 85.0,
                                height: 45.0,
                                decoration: BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(6.0),
                                        bottomRight: Radius.circular(6.0))),
                                child: GestureDetector(
                                  onTap: () {
                                    _resumeBloc.removeResume(resume);
                                  },
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
