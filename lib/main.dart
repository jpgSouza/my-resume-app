import 'package:flutter/material.dart';
import 'package:my_resume_app/constants.dart';
import 'package:my_resume_app/src/views/auth/login_view.dart';
import 'package:my_resume_app/src/views/auth/register_view.dart';
import 'package:my_resume_app/src/views/widgets/navigator/custom_bottom_navigator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "My Resume",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: primaryColor, fontFamily: font),
        home: LoginView());
  }
}
