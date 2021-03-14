import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FoodWastePost extends StatefulWidget {
  @override
  _FoodWastePostState createState() => _FoodWastePostState();
}

class _FoodWastePostState extends State<FoodWastePost> {
  File image;
  final picker = ImagePicker();

  void getImage() async {
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
