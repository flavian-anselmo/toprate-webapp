import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SignUpAuth with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;
  bool? isReg;

  Future<bool> signUpToIgas(String email, String password) async {
    //this method is for registration of the user to the application
    try {
      //create a user account method using firebase [passed email and pswd]
      await auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      //working 
      try {
        await user!.sendEmailVerification();
      } catch (e) {
        EasyLoading.showError(e.toString());
      }
      isReg = true;

      notifyListeners();
      return true;
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        //print('The password provided is too weak.');
        EasyLoading.showError('The password provided is too weak');
        isReg = false;
        notifyListeners();
        return false;
      } else if (error.code == 'email-already-in-use') {
        //print('The account already exists for that email.');
        EasyLoading.showError('The Account already exists for that email');
        isReg = false;
        notifyListeners();
        return false;
      } else {
        EasyLoading.showError('Something went wrong!');
        isReg = false;
        notifyListeners();
        throw Exception('Something went wrong!');
      }
    }
  }
}
/**
 * 
 * this is the registration page that handles it with 
 * firebase auth using provider with changnotifier 
 * 
 */