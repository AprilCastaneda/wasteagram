import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;

class PhotoStorageService {
  File image;
  String _url;

  PhotoStorageService({this.image});

  Future<void> storeImage() async {
    Reference ref =
        FirebaseStorage.instance.ref().child(Path.basename(image.path));
    UploadTask uploadTask = ref.putFile(image);
    uploadTask.whenComplete(() async {
      _url = await ref.getDownloadURL();
    }).catchError((onError) {
      print(onError);
    });
  }

  String get url => _url;
}
