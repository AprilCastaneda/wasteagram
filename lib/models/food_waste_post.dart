import 'package:cloud_firestore/cloud_firestore.dart';

class FoodWastePost {
  DateTime date;
  String image;
  int num_items;
  GeoPoint location;

  FoodWastePost({this.date, this.image, this.num_items, this.location});

  factory FoodWastePost.fromJSON(Map<String, dynamic> json) {
    return FoodWastePost(
        date: json['date'],
        image: json['image'],
        num_items: json['num_items'],
        location: json['location']);
  }
}
