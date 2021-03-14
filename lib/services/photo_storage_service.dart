import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class PhotoStorage extends StatefulWidget {
  @override
  _PhotoStorageState createState() => _PhotoStorageState();
}

class _PhotoStorageState extends State<PhotoStorage> {
  File image;

  void getImage() async {
    var picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    image = File(pickedFile.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      return Center(
        child: RaisedButton(
            child: Text('Select Photo'),
            onPressed: () {
              getImage();
            }),
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.file(image),
            SizedBox(height: 40),
            RaisedButton(child: Text('Post It!'), onPressed: () {}),
          ],
        ),
      );
    }
  }
}
