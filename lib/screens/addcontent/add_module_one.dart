import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topratepppp/constant.dart';
import 'package:topratepppp/services/pickfiles/pick_files.dart';
import 'package:topratepppp/widgets/animated.dart';

class AddModuleOne extends StatefulWidget {
  const AddModuleOne({Key? key}) : super(key: key);
  static const String id = "add_content_for_module_one ";

  @override
  _AddModuleOneState createState() => _AddModuleOneState();
}

class _AddModuleOneState extends State<AddModuleOne> {
  final _formkeyGlobal = GlobalKey<FormState>();

  late String description;
  late String title;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Content "),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formkeyGlobal,
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const AnimatedTxt(),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: ktextFieldDEcoratiion.copyWith(
                    labelText: 'title',
                    prefixIcon: const Icon(Icons.title),
                    hintText: "Material title ",
                  ),
                  onChanged: (value) {
                    //set the content title
                    title = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "*required field ";
                    } else if (value.length >= 30) {
                      return "less than 30 characters ";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: ktextFieldDEcoratiion.copyWith(
                    labelText: 'description',
                    prefixIcon: const Icon(Icons.description),
                    hintText: "Material description ",
                  ),
                  onChanged: (value) {
                    //setthe content description
                    description = value;
                  },
                  validator: (value) {
                    return null;
                  },
                ),
                 const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: kelevatedbutton,
                  onPressed: () {
                    if (_formkeyGlobal.currentState!.validate()) {
                      //validate the form before submssion
                      //pick files from local storage
                      Provider.of<PickFileService>(
                        context,
                        listen: false,
                      ).pickFileLocally(description: description, title: title);
                    }
                  },
                  child: const Text(
                    "Upload content ",
                    style: kloginbutton,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}