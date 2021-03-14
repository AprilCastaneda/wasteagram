import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/food_waste_post.dart';
import '../widgets/get_location.dart';

class FoodWastePostService {
  FoodWastePost post;
  FoodWastePostService({this.post});
  CollectionReference posts = FirebaseFirestore.instance.collection('posts');

  Future<void> addPost() {
    return posts
        .add({
          'date': post.date,
          'image': post.image,
          'num_items': post.num_items,
          'latitude': post.latitude,
          'longitude': post.longitude,
        })
        .then((value) => print('Post added.'))
        .catchError((error) => print('Failed to add post: $error'));
  }
}
