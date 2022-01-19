import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:topratepppp/constant.dart';
import 'package:topratepppp/screens/discuss/module_one_chat.dart';
import 'package:topratepppp/services/firestore/firestore.dart';
import 'package:topratepppp/widgets/module_returned.dart';

class ModuleTwo extends StatefulWidget {
  const ModuleTwo({Key? key}) : super(key: key);
  static const String id = kmodule2;

  @override
  _ModuleTwoState createState() => _ModuleTwoState();
}

class _ModuleTwoState extends State<ModuleTwo> {
  Future<dynamic> fetchFromDb() async {
    // FirebaseFirestore fireStoreInstance = FirebaseFirestore.instance;
    //routine to call the method form the firestore service
    try {
      Provider.of<FireStoreServices>(
        context,
        listen: false,
      ).fetchModuleContentFromFirestore().whenComplete(() => filterList());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> filterList() async {
    //used to filter the content display 
    try {
      Provider.of<FireStoreServices>(context, listen: false)
          .moduleContents
          .removeWhere((element) =>
              element["module"] == kmodule1 ||
              element["module"] == kmodule3 ||
              element["module"] == kmodule4 ||
              element["module"] == kmodule5);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ModuleTwo.id),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Discussions.id);
                },
                child: const Text('Discussion')),
          ),
        ],
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
