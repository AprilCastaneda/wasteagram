import 'package:flutter/material.dart';
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
