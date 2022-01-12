import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SignInAuth with ChangeNotifier {
  //This class will handle the signin or login of users
  // bool errorChecker = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  bool? isLog;

  Future<bool> signToIgas(String email, String password) async {
    //method that logs in registered users
    //returns true if logged in and false during error
    //bool isReg = false;
    try {
      await auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      EasyLoading.showSuccess("SignedIn Succesfully");

      isLog = true;
      notifyListeners();
      return true;
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        //errorChecker = true;
        EasyLoading.showError('No user found for that email');
        isLog = false;
        notifyListeners();
        //print('No user found for that email.');
        return false;
      } else if (error.code == 'wrong-password') {
        //errorChecker = true;
        EasyLoading.showError('Wrong password ');
        isLog = false;
        notifyListeners();
        //print('Wrong password provided for that user.');
        return false;
      } else {
        EasyLoading.showError("Something went wrong ");
        isLog = false;
        notifyListeners();
        throw Exception(error.toString());
      }
    }
  }
}