import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;

class PhotoStorageService {
  File image;
  String _url;
  FirebaseStorage storage = FirebaseStorage.instance;

  PhotoStorageService({this.image});

  Future<void> uploadImage() async {
    Reference ref = storage
        .ref()
        .child(Path.basename(image.path) + DateTime.now().toString());
    UploadTask uploadTask = ref.putFile(image);
    uploadTask.whenComplete(() async {
      _url = await ref.getDownloadURL();
      print(_url);
    }).catchError((onError) {
      print(onError);
    });
  }

  String get url => _url;
}
