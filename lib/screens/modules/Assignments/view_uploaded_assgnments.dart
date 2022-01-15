import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:topratepppp/services/firestore/download.dart';
import 'package:topratepppp/services/firestore/firestore.dart';

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

class ModuleWidget extends StatelessWidget {
  const ModuleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Provider.of<FireStoreServices>(context).assignmentsUploaded.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            child: ExpansionTile(
              title: ListTile(
                leading: Image.network(
                  "https://media.istockphoto.com/vectors/pdf-download-vector-icon-vector-id1263032734?k=20&m=1263032734&s=612x612&w=0&h=RNUAjin6RWIpjr-NgvnASdxAwUE6pyUafrk6LcoyRNo=",
                ),
                title: Text(
                  Provider.of<FireStoreServices>(
                    context,
                  ).assignmentsUploaded[index]["title"],
                ),
                trailing: TextButton(
                  onPressed: () async {
                    Provider.of<DownloadContent>(
                      context,
                      listen: false,
                    ).downLoadPdf(
                      Provider.of<FireStoreServices>(
                        context,
                        listen: false,
                      ).assignmentsUploaded[index]["link"],
                    );
                  },
                  child: const Text("Download"),
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(Provider.of<FireStoreServices>(
                      context,
                    ).assignmentsUploaded[index]["desc"]),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}