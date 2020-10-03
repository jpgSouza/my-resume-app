import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseDB {
  Firestore firestore;
  FirebaseAuth firebaseAuth;

  FirebaseDB() {
    firestore = Firestore.instance;
    firebaseAuth = FirebaseAuth.instance;
  }

  String getApp() {
    return firestore.app.toString();
  }

  Future<Null> createDoc(Map<String, dynamic> data) async {
    await firestore.collection("test").document('doc-test').setData(data);
  }
}
