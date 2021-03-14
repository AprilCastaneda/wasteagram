import 'package:flutter/material.dart';

class CameraFab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      // onPressed: () => displayJournalEntryForm(context),
      child: Icon(Icons.camera_alt),
    );
  }
}
