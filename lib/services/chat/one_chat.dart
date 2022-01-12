import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ModuleChat with ChangeNotifier {
  FirebaseFirestore firestoreChat = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  late User loggedInUser;
  List chats = [
    {
      "msg": "msg",
      "sender": "email",
    },
  ];
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

  Future<void> sendMessageToDb(String txtmessage) async {
    try {
      //send the msg to the db
      await fetchCurrentUser().whenComplete(() {
        //add the msg to the bakend
        firestoreChat
            .collection("discuss")
            .doc("b71NopwqcNrYYSDIU9Nd")
            .collection("mod1")
            .add(
          {
            "msg": txtmessage,
            "sender": loggedInUser.email,
          },
        );
      });
    } catch (e) {
      EasyLoading.showError("Error sending your questions");
    }
  }

  Future<dynamic> getMessagesSendToDb() async {
    try {
      //get the messages send to databse
      final messages = await firestoreChat
          .collection("discuss")
          .doc("b71NopwqcNrYYSDIU9Nd")
          .collection("mod1")
          .get();
      chats.clear(); //remove the initial data
      for (var msg in messages.docs) {
        chats.add(msg.data());
      }
      notifyListeners();
      return chats;
    } catch (e) {
      EasyLoading.showError("Error Loading  your messages");
    }
  }
}

/***
 * the msg is the text msg input 
 * the sender is the email addresss that is currently authenticated 
 * 
 * fetch the chats from the backend and convert them into chat widgets 
 * sender:grey 
 * reciver:blue 
 * 
 */
//driver program