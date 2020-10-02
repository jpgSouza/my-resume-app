import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_resume_app/constants.dart';
import 'package:my_resume_app/src/views/user/home_view.dart';

class BottomNavigator extends StatefulWidget {
  @override
  _BottomNavigator createState() => _BottomNavigator();
}

class _BottomNavigator extends State<BottomNavigator> {
  GlobalKey _bottomNavigatorKey = GlobalKey();

  int _startPage = 1;
  final HomeView _homeView = new HomeView();

  Widget _views = new HomeView();

  Widget _transition(int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        return _homeView;
        break;
      case 2:
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
          height: 65.0,
          items: <Widget>[
            Icon(Icons.add, color: Colors.white, size: 30.0),
            Icon(Icons.home, color: Colors.white, size: 30.0),
            Icon(Icons.exit_to_app, color: Colors.white, size: 30.0),
          ],
          onTap: (int pageIndex) {
            setState(() {
              _views = _transition(pageIndex);
            });
          }),
      body: _views,
    );
  }
}
