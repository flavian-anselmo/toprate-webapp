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
          Provider.of<FireStoreServices>(context).assignmentsUploaded.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            child: ExpansionTile(
              title: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                   
                    Provider.of<FireStoreServices>(
                      context,
                    ).assignmentsUploaded[index]["module"],
                     style:kmoduletxt,
                  ),
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
