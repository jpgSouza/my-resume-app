import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_resume_app/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
        title: "My Resume",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: primaryColor, fontFamily: font),
        home: LoginScreen());
  }
}
