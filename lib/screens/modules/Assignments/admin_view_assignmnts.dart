import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:topratepppp/services/firestore/firestore.dart';
import 'package:topratepppp/widgets/submitted_returned.dart';

class AdminViewAssignments extends StatefulWidget {
  const AdminViewAssignments({Key? key}) : super(key: key);
  static const String id = "view_assignmnts";

  @override
  _AdminViewAssignmentsState createState() => _AdminViewAssignmentsState();
}

class _AdminViewAssignmentsState extends State<AdminViewAssignments> {
  Future<dynamic> fetchFromDb() async {
    // FirebaseFirestore fireStoreInstance = FirebaseFirestore.instance;
    //routine to call the method form the firestore service
    try {
      Provider.of<FireStoreServices>(
        context,
        listen: false,
      ).getTheStudentSubmittedAssignments();
    } catch (e) {
      EasyLoading.showInfo("Check your Internet connection ");
      throw Exception(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Submitted Assignments"),
      ),
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

//done 
