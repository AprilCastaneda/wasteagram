import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/camera_fab.dart';
import '../models/food_waste_post.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class WasteListScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _WasteListScreenState createState() => _WasteListScreenState();
}

class _WasteListScreenState extends State<WasteListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wasteagram'),
      ),
      // body: Text('Body'),
      // body: StreamBuilder(),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('posts').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData ||
                snapshot.data.docs == null ||
                snapshot.data.docs.length <= 0)
              return Center(child: CircularProgressIndicator());
            return ListView.builder(
              // itemExtent: 80.0,
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) =>
                  postTile(context, snapshot.data.docs[index]),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Semantics(
        child: CameraFab(),
        button: true,
        enabled: true,
        onTapHint: 'Select an image',
      ),
    );
  }

  Widget postTile(BuildContext context, DocumentSnapshot document) {
    return ListTile(
        leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat('EEEE, MMMM d, yyyy')
                    .format(document['date'].toDate()),
                style: Theme.of(context).textTheme.headline6,
              )
            ]),
        title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                document['num_items'].toString(),
                style: Theme.of(context).textTheme.headline6,
              )
            ]),
        onTap: () {});
  }
}
