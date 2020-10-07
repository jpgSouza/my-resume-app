import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseDB {
  Firestore firestore;
  FirebaseAuth firebaseAuth;
  FirebaseUser firebaseUser;
  FirebaseStorage firebaseStorage;

  FirebaseDB() {
    firestore = Firestore.instance;
    firebaseAuth = FirebaseAuth.instance;
    firebaseStorage = FirebaseStorage.instance;
  }

  Future<Null> saveOnCloudFirestore(
      Map<String, dynamic> data, String collection) async {
    firestore.collection(collection).document(firebaseUser.uid).setData(data);
  }

  void loadCurrentUser() async {
    if (firebaseUser == null) firebaseUser = await firebaseAuth.currentUser();
  }
}
