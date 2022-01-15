import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topratepppp/services/firestore/download.dart';
import 'package:topratepppp/services/firestore/firestore.dart';

class ModuleWidget extends StatelessWidget {
  const ModuleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Provider.of<FireStoreServices>(context).moduleContents.length,
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
                  ).moduleContents[index]["title"],
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
                      ).moduleContents[index]["link"],
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
                    ).moduleContents[index]["desc"]),
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
