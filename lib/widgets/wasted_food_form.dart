import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:location/location.dart';
import '../models/food_waste_post.dart';
import '../widgets/get_location.dart';
import '../screens/waste_list_screen.dart';
import '../services/food_waste_post_service.dart';
import '../services/photo_storage_service.dart';

class WastedFoodForm extends StatefulWidget {
  final File image;

  WastedFoodForm({this.image});
  @override
  _WastedFoodFormState createState() => _WastedFoodFormState();
}

class _WastedFoodFormState extends State<WastedFoodForm> {
  final formKey = GlobalKey<FormState>();
  int numItems;
  String url;
  LocationData locData;
  double lat, long;
  FoodWastePost post = FoodWastePost();
  DateTime date;

  @override
  Widget build(BuildContext context) {
    if (widget.image == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Image.file(widget.image),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Form(
                  key: formKey,
                  child: itemQuantityField(context),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(''),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: uploadButton(context),
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget itemQuantityField(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * .025,
            horizontal: MediaQuery.of(context).size.width * .025),
        child: TextFormField(
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Number of Wasted Items',
            // hintText: Translations(Localizations.localeOf(context))
            //     .quantityFieldHint),
          ),
          style: Theme.of(context).textTheme.headline6,
          validator: validateItemQuantity,
          onSaved: saveItemQuantity,
        ));
  }

  String validateItemQuantity(String value) {
    return value.isEmpty ? 'Please enter a number' : null;
  }

  void saveItemQuantity(String value) {
    numItems = int.parse(value);
  }

  Widget uploadButton(BuildContext context) {
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: RaisedButton(
            child: Icon(Icons.cloud_upload,
                size: MediaQuery.of(context).size.height * .1),
            onPressed: () async {
              validateSaveUploadAndPop(context);
            }));
  }

  void validateSaveUploadAndPop(BuildContext context) async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();

      var newPost = await getPost();

      if (newPost == null) {
        CircularProgressIndicator();
      } else {
        var foodWastePostService = FoodWastePostService();
        await foodWastePostService.addPost(newPost);
        Navigator.of(context).pop();
      }
    }
  }

  Future<FoodWastePost> getPost() async {
    FoodWastePost newPost;
    newPost.num_items = numItems;
    newPost.date = DateTime.now();

    var photoStorageService = PhotoStorageService(image: widget.image);
    await photoStorageService.uploadImage().whenComplete(() {
      var img = photoStorageService.url;
      newPost.image = img;
    }).whenComplete(() {
      return newPost;
    });

    var locationService = GetLocation();
    await locationService.retrieveLocation().whenComplete(() {
      var locData = locationService.locationData;
      newPost.latitude = locData.latitude;
      newPost.longitude = locData.longitude;
    });
  }
}

// {
//   void initState() {}

//   @override
//   Widget build(BuildContext context){}

//   Widget itemQuantityField() {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 20),
//       child: TextFormField(
//           textAlign: TextAlign.center,
//           keyboardType: TextInputType.number,
//           decoration: InputDecoration(
//               hintText: Translations(Localizations.localeOf(context))
//                   .quantityFieldHint),
//           style: Theme.of(context).textTheme.display1,
//           validator: validateItemQuantity,
//           onSaved: saveITemQuantity),
//     );
//   }

//   String validateItemQuantity(String value) {}

//   void saveItemQuantity(String value) {}

//   Widget uploadButton() {}

//   void validateSaveUploadAndPop() {}
// }

// class Translations {
//   Locale locale;
//   Translations({this.locale});

//   final labels = {
//     'en': {
//       'quantityFieldHint': "number of Wasted Items"
//     },
//     'tlh': {
//       'quantityFieldHInt': 'ARGGHBARGH'
//     }
//   };

//   String get quantityFieldHint => labels[locale.languageCode]['quantityFieldHint'];
// }