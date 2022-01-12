import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class UploadToDb {
  //upload content to the data base
  // FirebaseStorage dbStorage = FirebaseStorage.instance;
  // FirebaseFirestore dbFirestore = FirebaseFirestore.instance;

  //method to upload the conetnt
  late String downloadURL = 'U';
  Future<String?> uploadContentToDb({
    required String destination,
    required String? file,
    required var fileBytes,
  }) async {
    try {
      final refDb = FirebaseStorage.instance.ref(destination);
      await refDb.putData(fileBytes);
      downloadURL = await refDb.getDownloadURL();
    } on FirebaseException catch (e) {
      EasyLoading.showError(e.toString());
    }
    return null;
  }
}
/**
 * upload content picked from storage 
 *  and upload the content 
 */