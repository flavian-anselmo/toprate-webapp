import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class FireStoreServices with ChangeNotifier {
  FirebaseFirestore fireStoreInstance = FirebaseFirestore.instance;
  //modules uploaded in the site
  List moduleContents = [
    //initial data to prevent errors
    {
      "desc": "no data",
      "title": "title",
      "link": "link",
    }
  ];
  //assignments uploaded for students
  List assignmentsUploaded = [
    {
      "desc": "no-descriptiion",
      "link": "module",
      "module": "mod[x]",
      "title": "no-title",
    }
  ];
  //assignmmnets to be marked by the instarctor
  List submittedAssignments = [
    {
      "module": "module ",
      "link": "download",
      "email":"email",
    }
  ];
  bool? isModuleFetched;
  bool? isAssignmentFtched;
  bool? isSubmitFecthed;
  Future<dynamic> fetchModuleContentFromFirestore() async {
    try {
      final contents = await fireStoreInstance
          .collection("material")
          .doc("hRB88ndcMjvYTmqw9bu1")
          .collection("module1")
          .get();
      moduleContents.clear(); //remove the initial data
      for (var cont in contents.docs) {
        //add the contents as per the doc access ID
        moduleContents.add(cont.data());
        // notifyListeners();
      }
      isModuleFetched = true;
      notifyListeners();
      EasyLoading.showSuccess("content fecthed Successfully");
      //print(moduleContents);
      return moduleContents;
    } catch (e) {
      isModuleFetched = false;
      notifyListeners();
      EasyLoading.showError(e.toString());
    }
  }

  ///fetch assignments
  Future<dynamic> getAssignmnetsFromFirestore() async {
    try {
      final contents = await fireStoreInstance
          .collection("assignment")
          .doc("hRB88ndcMjvYTmqw9bu1")
          .collection("assignment")
          .get();
      assignmentsUploaded.clear(); //remove the initial data
      for (var cont in contents.docs) {
        //add the contents as per the doc access ID
        assignmentsUploaded.add(cont.data());
        // notifyListeners();
      }
      isAssignmentFtched = true;
      notifyListeners();
      EasyLoading.showSuccess("content fecthed Successfully");
      //print(moduleContents);
      return assignmentsUploaded;
    } catch (e) {
      isAssignmentFtched = false;
      notifyListeners();
      EasyLoading.showError(e.toString());
    }
  }

  //get the assignments that were submitted by the students
  Future<dynamic> getTheStudentSubmittedAssignments() async {
    try {
      final contents = await fireStoreInstance
          .collection("submitAssign")
          .doc("hRB88ndcMjvYTmqw9bu1")
          .collection("submitassignment")
          .get();
      submittedAssignments.clear(); //remove the initial data
      for (var cont in contents.docs) {
        //add the contents as per the doc access ID
        submittedAssignments.add(cont.data());
        // notifyListeners();
      }
      isSubmitFecthed= true;
      notifyListeners();
      EasyLoading.showSuccess("content fecthed Successfully");
      //print(moduleContents);
      return submittedAssignments;
    } catch (e) {
      isSubmitFecthed = false;
      notifyListeners();
      EasyLoading.showError(e.toString());
    }
  }
}

/**
 * use provider to fetch the data from cloud firestore 
 * fetch the pdf content 
 * show a preview for the pdf 
 * allow downloads for the pdf content 
 */
//this routine will be used to fetch content posted on fire store by admin
/**
     * go to the main collection get the doc id and access the 5 subcollections 
     * but specifically module1 ....then from module one as acollection get the 
     * data stored on the collection 
     * 
     * tittle:"content title "
     * description:"description of the content "
     * link:"network link to allow downloading of  the content "
     * 
     * 
     */
