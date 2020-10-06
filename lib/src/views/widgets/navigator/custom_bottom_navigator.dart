import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_resume_app/constants.dart';
import 'package:my_resume_app/src/blocs/login_bloc.dart';
import 'package:my_resume_app/src/blocs/resume_bloc.dart';
import 'package:my_resume_app/src/views/user/home_view.dart';
import 'package:my_resume_app/src/views/user/logout_view.dart';
import 'package:my_resume_app/src/views/user/new_resume_view.dart';

class BottomNavigator extends StatefulWidget {
  @override
  _BottomNavigator createState() => _BottomNavigator();
}

class _BottomNavigator extends State<BottomNavigator> {
  GlobalKey _bottomNavigatorKey = GlobalKey();
  ResumeBloc _resumeBloc;
  LoginBloc _loginBloc;

  int _startPage = 1;
  final HomeView _homeView = new HomeView();
  final NewResume _newResume = new NewResume();
  final LogoutView _logoutView = new LogoutView();
  Widget _views = new HomeView();

  @override
  void initState() {
    super.initState();
    _resumeBloc = ResumeBloc();
    _loginBloc = LoginBloc();
  }

  Widget _transition(int index) {
    switch (index) {
      case 0:
        return _newResume;
        break;
      case 1:
        return _homeView;
        break;
      case 2:
        return _logoutView;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavigatorKey,
            index: _startPage,
            color: buttonColor,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 450),
            backgroundColor: Colors.transparent,
            height: 60.0,
            items: <Widget>[
              Icon(Icons.add, color: Colors.white, size: 30.0),
              Icon(Icons.home, color: Colors.white, size: 35.0),
              Icon(Icons.exit_to_app, color: Colors.white, size: 30.0),
            ],
            onTap: (int pageIndex) {
              setState(() {
                _views = _transition(pageIndex);
              });
            }),
        body: SafeArea(
          child: BlocProvider<ResumeBloc>(
            bloc: _resumeBloc,
            child: BlocProvider<LoginBloc>(bloc: _loginBloc, child: _views),
          ),
        ));
  }
}
