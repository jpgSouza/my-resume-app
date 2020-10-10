import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_resume_app/src/database/firebase.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
// import 'package:share/share.dart';

class PdfService {
  final doc = pw.Document();

  String URL;
  FirebaseDB _firebaseDB;

  PdfService() {
    _firebaseDB = new FirebaseDB();
  }

  void _generatePdf(DocumentSnapshot resumeSnapshot) async {
    doc.addPage(pw.Page(
        build: (pw.Context context) => pw.Center(
                child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                  pw.Text(
                      '${resumeSnapshot.data['fullName'].toString().toUpperCase()}',
                      style: pw.TextStyle(
                          fontSize: 25.0, color: PdfColor.fromHex("#5EAAA8"))),
                  pw.Text('${resumeSnapshot.data['email']}'),
                  pw.Text('${resumeSnapshot.data['phone']}'),
                  pw.SizedBox(height: 15.0),
                  pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Habilidade',
                            style: pw.TextStyle(
                                fontSize: 18.0,
                                color: PdfColor.fromHex("#5EAAA8"))),
                        pw.Container(
                            width: 500,
                            height: 1,
                            color: PdfColor.fromHex("#5EAAA8")),
                      ]),
                  pw.SizedBox(height: 5.0),
                  pw.Text('${resumeSnapshot.data['skill']['title']}'),
                  pw.SizedBox(height: 10.0),
                  pw.Text('- ${resumeSnapshot.data['skill']['description']}'),
                  pw.SizedBox(height: 15.0),
                  pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Curso',
                            style: pw.TextStyle(
                                fontSize: 18.0,
                                color: PdfColor.fromHex("#5EAAA8"))),
                        pw.Container(
                            width: 500,
                            height: 1,
                            color: PdfColor.fromHex("#5EAAA8")),
                      ]),
                  pw.Text('- ${resumeSnapshot.data['course']['title']}'),
                  pw.Text('${resumeSnapshot.data['course']['date']}'),
                  pw.Text('${resumeSnapshot.data['course']['institute']}'),
                ]))));
    await _savePdf(resumeSnapshot);
  }

  void _savePdf(DocumentSnapshot resumeSnapshot) async {
    StorageUploadTask upload = _firebaseDB.firebaseStorage
        .ref()
        .child('resumes')
        .child('${resumeSnapshot.documentID}')
        .child(DateTime.now().millisecondsSinceEpoch.toString())
        .putData(doc.save());

    StorageTaskSnapshot taskSnapshot = await upload.onComplete;
    URL = await taskSnapshot.ref.getDownloadURL();
  }

  void share(BuildContext context, DocumentSnapshot resumeSnapshot) async {
    await _generatePdf(resumeSnapshot);
    final RenderBox box = context.findRenderObject();
    /*
    Share.share(URL,
        subject: 'My resume',
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);*/
  }
}
