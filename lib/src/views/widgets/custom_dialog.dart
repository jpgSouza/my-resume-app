import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_resume_app/constants.dart';

class CustomDialog extends StatelessWidget {
  final DocumentSnapshot resume;
  final Function delete;
  CustomDialog(this.resume, this.delete);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Deletar',
                  style: TextStyle(
                      color: buttonColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
                SizedBox(height: 16.0),
                Text('Deseja realmente deletar  ${resume.data['title']} ?',
                    style: TextStyle(
                      color: buttonColor,
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.center),
                SizedBox(height: 24.0),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FlatButton(
                    onPressed: () {
                      delete(resume);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "SIM",
                      style: TextStyle(
                          color: buttonColor,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
