import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topratepppp/constant.dart';
import 'package:topratepppp/services/firestore/download.dart';
import 'package:topratepppp/services/firestore/firestore.dart';

class ModuleWidget extends StatelessWidget {
  const ModuleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:
          Provider.of<FireStoreServices>(context).submittedAssignments.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            child: ListTile(
              leading: Card(
                color: Colors.blueGrey,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(Provider.of<FireStoreServices>(
                    context,
                  ).submittedAssignments[index]["email"]),
                ),
              ),
              title: Text(
                Provider.of<FireStoreServices>(
                  context,
                ).submittedAssignments[index]["module"],
                style: kmoduletxt,
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
                    ).submittedAssignments[index]["link"],
                  );
                },
                child: const Text("Download"),
              ),
            ),
          ),
        );
      },
    );
  }
}
//done 