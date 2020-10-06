import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_resume_app/src/database/firebase.dart';
import 'package:rxdart/rxdart.dart';

class ResumeBloc extends BlocBase {
  FirebaseDB firebaseDB;
  Map<String, dynamic> resumeData = Map();

  //Constrollers
  final _titleController = BehaviorSubject<String>();
  final _fullNameController = BehaviorSubject<String>();
  final _phoneController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _skillTitleController = BehaviorSubject<String>();
  final _skillDescriptionController = BehaviorSubject<String>();
  final _courseTitleController = BehaviorSubject<String>();
  final _courseDateController = BehaviorSubject<String>();
  final _courseInstituteController = BehaviorSubject<String>();
  final _resumeController = BehaviorSubject<List>();

  //Streams
  Stream<String> get outTitle => _titleController.stream;
  Stream<String> get outFullName => _fullNameController.stream;
  Stream<String> get outPhone => _phoneController.stream;
  Stream<String> get outEmail => _emailController.stream;
  Stream<String> get outSkillTitle => _skillTitleController.stream;
  Stream<String> get outSkillDescription => _skillDescriptionController.stream;
  Stream<String> get outCourseTitle => _courseTitleController.stream;
  Stream<String> get outCourseDate => _courseDateController.stream;
  Stream<String> get outCourseInstitute => _courseInstituteController.stream;
  Stream<List> get outResumes => _resumeController.stream;

  Function(String) get changeTitle => _titleController.sink.add;
  Function(String) get changeFullName => _fullNameController.sink.add;
  Function(String) get changePhone => _phoneController.sink.add;
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changeSkillTitle => _skillTitleController.sink.add;
  Function(String) get changeSkillDescription =>
      _skillDescriptionController.sink.add;
  Function(String) get changeCourseTitle => _courseTitleController.sink.add;
  Function(String) get changeCourseDate => _courseDateController.sink.add;
  Function(String) get changeCourseInstitute =>
      _courseInstituteController.sink.add;

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
    _titleController.close();
    _fullNameController.close();
    _phoneController.close();
    _emailController.close();
    _skillTitleController.close();
    _skillDescriptionController.close();
    _courseTitleController.close();
    _courseDateController.close();
    _courseInstituteController.close();
  }

  void _addResumeListener() {
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
