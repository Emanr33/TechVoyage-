import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class FirebaseStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String?> uploadFile(File file, String filePath) async {
    try {
      Reference storageReference = _storage.ref().child(filePath);
      UploadTask uploadTask = storageReference.putFile(file);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

      String downloadURL = await taskSnapshot.ref.getDownloadURL();
      print('uploaded');
      return downloadURL;
    } catch (e) {
      print('Error uploading file: $e');
      return null;
    }
  }

  Future<Map<String, String?>> uploadImages(File upperBody, File lowerBody) async {
    EasyLoading.show();
    String? upperBodyUrl = await uploadFile(upperBody, upperBody.path);
    String? lowerBodyUrl = await uploadFile(lowerBody, lowerBody.path);
    EasyLoading.dismiss();
    return {
      'upperBodyUrl': upperBodyUrl,
      'lowerBodyUrl': lowerBodyUrl,
    };
  }
}
