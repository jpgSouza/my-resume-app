import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseDB {
  Firestore firestore;
  FirebaseAuth firebaseAuth;
  FirebaseUser firebaseUser;

  FirebaseDB() {
    firestore = Firestore.instance;
    firebaseAuth = FirebaseAuth.instance;
    _loadCurrentUser();
  }

  Future<Null> saveOnCloudFirestore(
      Map<String, dynamic> data, String collection) async {
    firestore.collection(collection).document(firebaseUser.uid).setData(data);
  }

  void _loadCurrentUser() async {
    if (firebaseUser == null) firebaseUser = await firebaseAuth.currentUser();
    print(firebaseUser.uid);
  }
}
