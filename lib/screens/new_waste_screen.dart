import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;
import 'package:transparent_image/transparent_image.dart';
import '../db/food_waste_dto.dart';

class NewWasteScreen extends StatefulWidget {
  static const routeName = 'newWasteScreen';
  @override
  _NewWasteScreenState createState() => _NewWasteScreenState();
}

class _NewWasteScreenState extends State<NewWasteScreen> {
  final formKey = GlobalKey<FormState>();
  final foodWasteDTO = FoodWasteDTO();

  LocationData _locationData;
  var locationService = Location();

  @override
  void initState() {
    super.initState();
    retrieveLocation();
    getImage();
  }

  void retrieveLocation() async {
    try {
      var _serviceEnabled = await locationService.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await locationService.requestService();
        if (!_serviceEnabled) {
          print('Failed to enable service. Returning.');
          return;
        }
      }

      var _permissionGranted = await locationService.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await locationService.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          print('Location service permission not granted. Returning.');
        }
      }

      _locationData = await locationService.getLocation();
    } on PlatformException catch (e) {
      print('Error: ${e.toString()}, code: ${e.code}');
      _locationData = null;
    }
    _locationData = await locationService.getLocation();
    foodWasteDTO.latitude = _locationData.latitude;
    foodWasteDTO.longitude = _locationData.longitude;
  }

  Future<String> getImage() async {
    File image;
    String _url;
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    image = File(pickedFile.path);

    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage
        .ref()
        .child(Path.basename(image.path) + DateTime.now().toString());
    UploadTask uploadTask = ref.putFile(image);
    final url = await (await uploadTask).ref.getDownloadURL();
    foodWasteDTO.image = url;
    _url = url;

    setState(() {
      if (pickedFile == null) {
        print('File not selected.');
      } else {
        _url = pickedFile.path;
      }
    });
  }

  void addDateToFoodWasteDTO() {
    foodWasteDTO.date = DateTime.now();
  }

  void validateSaveUploadAndPop(BuildContext context) async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      addDateToFoodWasteDTO();

      CollectionReference posts =
          FirebaseFirestore.instance.collection('posts');
      posts
          .add({
            'date': foodWasteDTO.date,
            'image': foodWasteDTO.image,
            'numItems': foodWasteDTO.numItems,
            'latitude': foodWasteDTO.latitude,
            'longitude': foodWasteDTO.longitude,
          })
          .then((value) => print('Post added.'))
          .catchError((error) => print('Failed to add post: $error'));
      Navigator.of(context).pop();
    } else {
      print('Invalid form.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Post'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: foodWasteDTO.image == null
                  ? CircularProgressIndicator()
                  : FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: foodWasteDTO.image,
                    ),
            ),
            Expanded(
                flex: 1,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Number of Wasted Items',
                    // hintText: Translations(Localizations.localeOf(context))
                    //     .quantityFieldHint),
                  ),
                  style: Theme.of(context).textTheme.headline6,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: validateItemQuantity,
                  onSaved: saveItemQuantity,
                )),
          ],
        ),
      ),
      bottomNavigationBar: uploadButton(context),
    );
  }

  String validateItemQuantity(String value) {
    return value.isEmpty || int.parse(value).isNegative
        ? 'Please enter a positive number'
        : null;
  }

  void saveItemQuantity(String value) {
    foodWasteDTO.numItems = int.parse(value);
  }

  Widget uploadButton(BuildContext context) {
    return Semantics(
      child: SizedBox(
          height: MediaQuery.of(context).size.height * .15,
          width: double.infinity,
          child: Container(
            color: Colors.blue,
            child: GestureDetector(
                child: Icon(Icons.cloud_upload,
                    size: MediaQuery.of(context).size.height * .1),
                onTap: () {
                  validateSaveUploadAndPop(context);
                }),
          )),
      label: 'Upload New Food Waste Post',
    );
  }
}
