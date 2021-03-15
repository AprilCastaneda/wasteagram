import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/camera_fab.dart';
import '../screens/waste_detail_screen.dart';

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
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('posts')
              .orderBy('date', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData ||
                snapshot.data.docs == null ||
                snapshot.data.docs.length <= 0)
              return Center(child: CircularProgressIndicator());
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) =>
                  postTile(context, snapshot.data.docs[index]),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CameraFab(),
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
                document['numItems'].toString(),
                style: Theme.of(context).textTheme.headline6,
              )
            ]),
        onTap: () {
          Navigator.of(context)
              .pushNamed(WasteDetailScreen.routeName, arguments: document);
        });
  }
}
