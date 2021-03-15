import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/food_waste_post.dart';

class FoodWastePostService {
  CollectionReference posts = FirebaseFirestore.instance.collection('posts');

  Future<void> addPost(FoodWastePost post) async {
    posts
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
