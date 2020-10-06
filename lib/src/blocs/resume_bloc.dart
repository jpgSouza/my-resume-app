import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_resume_app/src/database/firebase.dart';
import 'package:my_resume_app/src/model/entities/user_model.dart';
import 'package:rxdart/rxdart.dart';

class ResumeBloc extends BlocBase {
  FirebaseDB firebaseDB;
  User user;
  final _resumeController = BehaviorSubject<List>();

  Stream<List> get outResumes => _resumeController.stream;

  List<DocumentSnapshot> _resumes = [];

  ResumeBloc() {
    firebaseDB = FirebaseDB();
    firebaseDB.loadCurrentUser();
    Future.delayed(Duration(milliseconds: 500), () {
      _addResumeListener();
    });
  }

  @override
  void dispose() {
    _resumeController.close();
  }

  void _addResumeListener() {
    print(firebaseDB.firebaseUser.uid);
    firebaseDB.firestore
        .collection('users')
        .document(firebaseDB.firebaseUser.uid)
        .collection('resumes')
        .snapshots()
        .listen((snapshot) {
      snapshot.documentChanges.forEach((change) {
        String oid = change.document.documentID;
        switch (change.type) {
          case DocumentChangeType.added:
            _resumes.add(change.document);
            break;
          case DocumentChangeType.modified:
            _resumes.removeWhere((resume) => resume.documentID == oid);
            _resumes.add(change.document);
            break;
          case DocumentChangeType.removed:
            _resumes.removeWhere((resume) => resume.documentID == oid);
            break;
        }
      });

      _resumeController.add(_resumes);
    });
  }
}
