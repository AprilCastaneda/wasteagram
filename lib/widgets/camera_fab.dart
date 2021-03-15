import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../screens/new_waste_screen.dart';

class CameraFab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      child: FloatingActionButton(
          onPressed: () =>
              Navigator.of(context).pushNamed(NewWasteScreen.routeName),
          child: Icon(Icons.camera_alt),
          tooltip: 'Add image'),
      label: 'New Food Waste Post',
    );
  }
}


// class CameraFab extends StatefulWidget {
//   @override
//   _CameraFabState createState() => _CameraFabState();
// }

// class _CameraFabState extends State<CameraFab> {

  // File image;
  // final picker = ImagePicker();

  // void getImage() async {
  //   final pickedFile = await picker.getImage(source: ImageSource.gallery);
  //   image = File(pickedFile.path);
  //   Navigator.of(context).pushNamed(NewWasteScreen.routeName, arguments: image);
  //   setState(() {});
  // }

  // @override
  // Widget build(BuildContext context) {
  //   // if (image == null) {
  //     return FloatingActionButton(
  //         onPressed: () => getImage(),
  //         child: Icon(Icons.camera_alt),
  //         tooltip: 'Add image');
    // } else {
    //   return Center(child: CircularProgressIndicator());
    // }
