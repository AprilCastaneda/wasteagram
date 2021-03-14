import 'package:cloud_firestore/cloud_firestore.dart';

class FoodWastePost {
  DateTime date;
  String image;
  int num_items;
  double latitude;
  double longitude;

  FoodWastePost(
      {this.date, this.image, this.num_items, this.latitude, this.longitude});

  factory FoodWastePost.fromJSON(Map<String, dynamic> json) {
    return FoodWastePost(
        date: json['date'],
        image: json['image'],
        num_items: json['num_items'],
        latitude: json['location'].getLatitude(),
        longitude: json['location'].getLongitude());
  }
}
