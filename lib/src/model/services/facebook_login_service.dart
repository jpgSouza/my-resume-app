import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:my_resume_app/src/database/firebase.dart';
import 'package:http/http.dart' as http;

enum FacebookStatus { IDDLE, LOADING, SUCCESS, FAIL }

class FacebookLoginService {
  static final _facebookLogin = FacebookLogin();
  var _token;
  var _profile;
  FirebaseDB _firebaseDB;

  FacebookLoginService() {
    _firebaseDB = FirebaseDB();
    FacebookStatus.IDDLE;
  }

  Future<FirebaseUser> _loginWithFacebook() async {
    FacebookStatus.LOADING;
    final FacebookLoginResult _result = await _facebookLogin.logIn(['email']);

    switch (_result.status) {
      case FacebookLoginStatus.loggedIn:
        final facebookAuthCred = FacebookAuthProvider.getCredential(
            accessToken: _result.accessToken.token);
        _token = _result.accessToken.token;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${_token}');
        _profile = jsonDecode(graphResponse.body);
        _firebaseDB.firebaseUser = await _firebaseDB.firebaseAuth
            .signInWithCredential(facebookAuthCred);
        return _firebaseDB.firebaseUser;
        FacebookStatus.SUCCESS;
        break;

      case FacebookLoginStatus.error:
        return null;
        FacebookStatus.FAIL;
        break;
      case FacebookLoginStatus.cancelledByUser:
        return null;
        FacebookStatus.FAIL;
        break;
    }
  }

  void logIn() {
    _loginWithFacebook().then((user) {
      if (user != null) {
        _firebaseDB.firebaseUser = user;
        _firebaseDB.saveOnCloudFirestore(_profile, 'users');
      }
    });
  }

  void logout() {
    _facebookLogin.logOut();
    _firebaseDB.firebaseAuth.signOut();
  }
}
