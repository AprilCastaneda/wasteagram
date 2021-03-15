import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';
import '../models/food_waste_post.dart';

class WasteDetailScreen extends StatefulWidget {
  static const routeName = 'wasteDetailScreen';
  @override
  _WasteDetailScreenState createState() => _WasteDetailScreenState();
}

class _WasteDetailScreenState extends State<WasteDetailScreen> {
  @override
  Widget build(BuildContext context) {
    DocumentSnapshot document = ModalRoute.of(context).settings.arguments;
    Timestamp time = document['date'];
    DateTime date =
        DateTime.fromMicrosecondsSinceEpoch(time.microsecondsSinceEpoch);

    final FoodWastePost foodWastePost = FoodWastePost(
        date: date,
        image: document['image'],
        numItems: document['numItems'],
        latitude: document['latitude'],
        longitude: document['longitude']);

    return Scaffold(
      appBar: AppBar(
        title: Text('Wasteagram'),
      ),
      body: Container(
        child: Column(
          children: [
            Text(
              // foodWastePost.getDate.toString(),
              DateFormat('EEEE, MMMM d, yyyy').format(foodWastePost.getDate),
              style: Theme.of(context).textTheme.headline6,
            ),
            foodWastePost.getImage == null
                ? CircularProgressIndicator()
                : FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: foodWastePost.getImage,
                  ),
            Text(
              foodWastePost.getNumItems.toString() + ' items',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              'Location(' +
                  foodWastePost.getLatitude.toString() +
                  ', ' +
                  foodWastePost.getLongitude.toString() +
                  ')',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
