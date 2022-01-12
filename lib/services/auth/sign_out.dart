import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SignOutAuth with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> signOutFromIgas() async {
    try {
      await auth.signOut().whenComplete(() {
        EasyLoading.showToast("Signed Out ");
      }); //firebase sign out
      notifyListeners();
    } catch (e) {
      EasyLoading.showError('Something went wrong!');
      notifyListeners();
      throw Exception("Something went wrong!");
    }
    notifyListeners();
  }
}