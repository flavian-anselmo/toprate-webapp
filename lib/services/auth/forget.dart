import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ResetpasswordAuth with ChangeNotifier {
  //reset the pasword using email
  FirebaseAuth auth = FirebaseAuth.instance;

  //method to send password reset email
  Future<void> resetPassword(String email) async {
    //firebase method to send the email
    try {
      await auth.sendPasswordResetEmail(email: email).whenComplete(
          () => EasyLoading.showInfo("check your email to reset password"));
      notifyListeners();
    } catch (e) {
      EasyLoading.showError("error occurred while sending email!");
      throw Exception('error encounterd!');
    }
  }
}