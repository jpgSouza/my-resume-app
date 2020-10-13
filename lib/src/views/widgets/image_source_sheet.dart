import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceSheet extends StatelessWidget {
  final Function(File) onImageSelected;
  ImageSourceSheet({this.onImageSelected});

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        onClosing: () {},
        builder: (context) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FlatButton(
                    onPressed: () async {
                      File image = await ImagePicker.pickImage(
                          source: ImageSource.camera);
                      imageSelected(image);
                    },
                    child: Text("Camera")),
                FlatButton(
                    onPressed: () async {
                      File image = await ImagePicker.pickImage(
                          source: ImageSource.gallery);
                      imageSelected(image);
                    },
                    child: Text("Galeria"))
              ],
            ));
  }

  void imageSelected(File image) async {
    if (image != null) {
      //File croppedImage = await ImageCropper.cropImage(sourcePath: image.path);
      onImageSelected(image);
    }
  }
}
