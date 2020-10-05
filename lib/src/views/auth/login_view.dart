import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_resume_app/constants.dart';
import 'package:my_resume_app/src/blocs/login_bloc.dart';
import 'package:my_resume_app/src/views/auth/register_view.dart';
import 'package:my_resume_app/src/views/widgets/custom_divider.dart';
import 'package:my_resume_app/src/views/widgets/form/custom_box.dart';
import 'package:my_resume_app/src/views/widgets/form/custom_input_fields.dart';
import 'package:my_resume_app/src/views/widgets/navigator/custom_bottom_navigator.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _loginBloc = LoginBloc();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _loginBloc.outState.listen((state) {
      switch (state) {
        case LoginState.SUCCESS:
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => BottomNavigator()));
          break;
        case LoginState.FAIL:
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text(
              "Credenciais incorretas",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            elevation: 6.0,
            backgroundColor: Colors.redAccent,
            duration: Duration(seconds: 2),
          ));
          break;
        case LoginState.LOADING:
        case LoginState.IDLE:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: StreamBuilder<LoginState>(
          stream: _loginBloc.outState,
          builder: (context, snapshot) {
            switch (snapshot.data) {
              case LoginState.LOADING:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case LoginState.FAIL:
              case LoginState.SUCCESS:
              case LoginState.IDLE:
                return Form(
                  child: SafeArea(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Stack(
                        children: [
                          Positioned(
                              child: Container(
                                  child: SvgPicture.asset(
                                      "assets/images/upbackground.svg"))),
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
                                  child: SvgPicture.asset(
                                      "assets/images/loginlogo.svg"))),
                          Positioned(
                              left: 0.0,
                              right: 0.0,
                              bottom: 255.0,
                              child: CustomBox(
                                  null,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          Colors.white,
                                          _loginBloc.outEmail,
                                          _loginBloc.changeEmail),
                                      Container(
                                          padding: EdgeInsets.all(2.0),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.white)))),
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
                                          Colors.white,
                                          _loginBloc.outPassword,
                                          _loginBloc.changePassword),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: FlatButton(
                                          padding: EdgeInsets.zero,
                                          onPressed: () {},
                                          child: Text(
                                            "Esqueceu sua senha?",
                                            textAlign: TextAlign.right,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  0.0,
                                  primaryColor)),
                          Positioned(
                            right: 0.0,
                            left: 0.0,
                            bottom: 170.0,
                            child: Container(
                              height: 55.0,
                              alignment: Alignment.center,
                              child: RaisedButton(
                                onPressed: _loginBloc.submit,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                padding: EdgeInsets.all(0.0),
                                child: Ink(
                                    decoration: BoxDecoration(
                                        color: buttonColor,
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                    child: Container(
                                      constraints: BoxConstraints(
                                          maxWidth: 215.0, minHeight: 60.0),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "LOGIN",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    )),
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 140.0,
                              left: 25.0,
                              right: 25.0,
                              child: Container(
                                  alignment: Alignment.center,
                                  child: CustomDivider(primaryColor, "OU",
                                      secondaryColor, 145.0))),
                          Positioned(
                              bottom: 80.0,
                              left: 75.0,
                              right: 75.0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                              builder: (context) =>
                                                  RegisterView()));
                                    },
                                    padding: EdgeInsets.zero,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
          }),
    );
  }
}
