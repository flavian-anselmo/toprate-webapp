import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:topratepppp/services/firestore/firestore.dart';
import 'package:topratepppp/widgets/assignment_returned.dart';

class UploadedAssignments extends StatefulWidget {
  const UploadedAssignments({Key? key}) : super(key: key);
  static const id = "uploadAssignment";

  @override
  _UploadedAssignmentsState createState() => _UploadedAssignmentsState();
}

class _UploadedAssignmentsState extends State<UploadedAssignments> {
  List assignments = [];

  Future<dynamic> fetchFromDb() async {
    // FirebaseFirestore fireStoreInstance = FirebaseFirestore.instance;
    //routine to call the method form the firestore service
    try {
      Provider.of<FireStoreServices>(
        context,
        listen: false,
      ).getAssignmnetsFromFirestore();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: SizedBox(
            width: 600,
            child: Card(
              child: FutureBuilder(
                future: fetchFromDb(),
                //initialData: InitialData,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ModuleWidget(),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    //EasyLoading.showError("status");
                    EasyLoading.show(status: "Loading...");
                    return const Center(
                      child: Text("Loading..."),
                    );
                  } else if (snapshot.hasError) {
                    EasyLoading.showError("Error occurred while fetching!");
                    return const Center(
                      child: Text(
                        "Took long to load, kindly check internet connection",
                      ),
                    );
                  }
                  EasyLoading.showInfo("No content found!");
                  return const Center(
                    child: Text("No content Found!"),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}


