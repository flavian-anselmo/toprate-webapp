import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:topratepppp/screens/discuss/module_one_chat.dart';
import 'package:topratepppp/services/firestore/upload.dart';

class PickFileService with ChangeNotifier {
  String? file;
  String destination = '/';
  UploadToDb uploadToDb = UploadToDb();
  FirebaseFirestore firestoreModStore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> pickFileLocally({
    required String description,
    required String title,
  }) async {
    FilePickerResult? resultFromStorage = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ["pdf"],
    );
    try {
      if (resultFromStorage != null) {
        final filebytes = resultFromStorage.files.first.bytes!;
        String fileName = resultFromStorage.files.first.name;

        destination = 'content/mod1/$fileName';
        await EasyLoading.show(status: 'loading...');

        await uploadToDb
            .uploadContentToDb(
          destination: destination,
          fileBytes: filebytes,
        )
            .whenComplete(() async {
          try {
            if (destination.length > 1) {
              await uploadToFirestore(
                decsription: description,
                title: title,
                downloadLink: uploadToDb.downloadURL,
              );
              await EasyLoading.showSuccess("uploaded");
            }
          } catch (e) {
            await EasyLoading.showError(e.toString());
          }
        });
        notifyListeners();
      } else {
        EasyLoading.showInfo("no item was selected");
      }
    } catch (e) {
      EasyLoading.showError("Something went wrong!");
    }
  }

  Future<void> uploadToFirestore({
    required String decsription,
    required String title,
    required String downloadLink,
  }) async {
    try {
      await fetchCurrentUser().whenComplete(() {
        firestoreModStore
            .collection('material')
            .doc('hRB88ndcMjvYTmqw9bu1')
            .collection('module1')
            .add(
          {
            "desc": decsription,
            "title": title,
            "link": downloadLink,
          },
        );
      });
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }

  Future<void> fetchCurrentUser() async {
    //get the current email authenticated
    try {
      final user = auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }
}
/**
 * ----[file_picker]---[plugin] 
 * allow picking files locally 
 * allow user to pick local files eg pdf docx sheets etc 
 * when openning the app storage the app only allows the
 * user to upload pdf files 
 */