import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/wasted_food_form.dart';

class NewWasteScreen extends StatefulWidget {
  static const routeName = 'newWasteScreen';
  @override
  _NewWasteScreenState createState() => _NewWasteScreenState();
}

class _NewWasteScreenState extends State<NewWasteScreen> {
  @override
  Widget build(BuildContext context) {
    File image = ModalRoute.of(context).settings.arguments;
    // if (image == null) {
    //   return Scaffold(
    //       appBar: AppBar(
    //         title: Text('New Post'),
    //       ),
    //       body: Center(child: CircularProgressIndicator()));
    // } else {
    //   return Scaffold(
    return Scaffold(
      appBar: AppBar(
        title: Text('New Post'),
      ),
      body: WastedFoodForm(image: image),
    );
    // body: Center(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     children: [
    //       // Image.file(image),
    //       WastedFoodForm(image: image),
    //     ],
    //   ),
    // ));
  }
}
