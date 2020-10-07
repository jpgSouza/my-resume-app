import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:my_resume_app/src/database/firebase.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfService {
  static final doc = pw.Document();

  static FirebaseDB _firebaseDB;

  PdfService() {
    _firebaseDB = new FirebaseDB();
  }

  void generatePdf() async {
    doc.addPage(pw.Page(
        build: (pw.Context context) => pw.Center(child: pw.Text("Ola mundo"))));
    await _savePdf();
  }

  void _savePdf() async {
    StorageUploadTask upload = _firebaseDB.firebaseStorage
        .ref()
        .child('teste')
        .child('doc')
        .putData(doc.save());

    StorageTaskSnapshot taskSnapshot = await upload.onComplete;
    String URL = await taskSnapshot.ref.getDownloadURL();
    print(URL);
  }
}
