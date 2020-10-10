import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_resume_app/src/database/firebase.dart';

class GoogleLoginService {
  final _googleLogin = GoogleSignIn();

  FirebaseDB _firebaseDB;

  GoogleLoginService() {
    _firebaseDB = FirebaseDB();
  }

  Future<FirebaseUser> _loginWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await _googleLogin.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    await _firebaseDB.firebaseAuth
        .signInWithCredential(credential)
        .then((user) {
      _firebaseDB.firebaseUser = user;
    });
  }

  void logout() async {
    await _googleLogin.signOut();
    _firebaseDB.firebaseAuth.signOut();
  }

  void logIn() {
    _loginWithGoogle().then((user) {
      if (user != null) {
        _firebaseDB.firebaseUser = user;
      }
    });
  }
}
