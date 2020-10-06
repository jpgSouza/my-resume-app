import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_resume_app/src/database/firebase.dart';
import 'package:my_resume_app/src/model/entities/user_model.dart';
import 'package:my_resume_app/src/model/validators/user_input_validator.dart';
import 'package:rxdart/rxdart.dart';

enum LoginState { IDLE, LOADING, SUCCESS, FAIL }

class LoginBloc extends BlocBase with UserInputValidator {
  FirebaseDB firebaseDB;
  User user;

  //Controllers
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _stateController = BehaviorSubject<LoginState>();

  //Streams
  Stream<String> get outEmail =>
      _emailController.stream.transform(validateEmail);
  Stream<String> get outPassword =>
      _passwordController.stream.transform(validatePassword);
  Stream<LoginState> get outState => _stateController.stream;

  StreamSubscription _streamSubscription;

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  LoginBloc() {
    user = User.def();
    firebaseDB = FirebaseDB();
    _streamSubscription =
        firebaseDB.firebaseAuth.onAuthStateChanged.listen((userAuth) {
      if (userAuth != null) {
        _stateController.add(LoginState.SUCCESS);
        //firebaseDB.firebaseAuth.signOut();
      } else {
        _stateController.add(LoginState.IDLE);
      }
    });
  }

  void submit() {
    String _email = _emailController.value;
    String _password = _passwordController.value;

    _stateController.add(LoginState.LOADING);

    firebaseDB.firebaseAuth
        .signInWithEmailAndPassword(email: _email, password: _password)
        .catchError((err) {
      _stateController.add(LoginState.FAIL);
    });
  }

  void recoverPassword() {
    String _email = _emailController.value;

    firebaseDB.firebaseAuth.sendPasswordResetEmail(email: _email);
  }

  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
    _stateController.close();

    _streamSubscription.cancel();
  }
}
