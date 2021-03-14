import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/food_waste_post.dart';
import '../screens/waste_list_screen.dart';

class WastedFoodForm extends StatefulWidget {
  final File image;

  WastedFoodForm({this.image});
  @override
  _WastedFoodFormState createState() => _WastedFoodFormState();
}

class _WastedFoodFormState extends State<WastedFoodForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    if (widget.image == null) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
          Flexible(
            flex: 2,
            fit: FlexFit.loose,
            child: Container(child: Image.file(widget.image)),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Container(
              child: Form(
                key: formKey,
                child: itemQuantityField(),
              ),
            ),
          ),
          Flexible(flex: 8, fit: FlexFit.loose, child: Spacer()),
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Expanded(child: uploadButton()),
            ),
          ),
        ])));
  }

  Widget itemQuantityField() {
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
    FirebaseFirestore.instance
        .collection('posts')
        .add({'date': DateTime.now(), 'num_items': value});
  }

  Widget uploadButton() {
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: RaisedButton(
            child: Icon(Icons.cloud_upload,
                size: MediaQuery.of(context).size.height * .1),
            onPressed: () async {
              validateSaveUploadAndPop();
            }));
  }

  void validateSaveUploadAndPop() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      Navigator.of(context).pushNamed(WasteListScreen.routeName);
    }
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