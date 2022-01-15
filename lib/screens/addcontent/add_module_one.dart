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
  String dropdownvalue = 'Module 1';

  // List of items in our dropdown menu
  var items = [
    'Module 1',
    'Module 2',
    'Module 3',
    'Module 4',
    'Module 5',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Content "),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://chiefexecutive.net/wp-content/uploads/2020/11/AdobeStock_246230613.jpg'),
              fit: BoxFit.cover, // -> 02
            ),
          ),
          child: Center(
            child: SizedBox(
              width: 500,
              child: Card(
                child: Form(
                  key: _formkeyGlobal,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const AnimatedTxt(),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          value: dropdownvalue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
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
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
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
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: kelevatedbutton,
                          onPressed: () {
                            if (_formkeyGlobal.currentState!.validate()) {
                              //validate the form before submssion
                              //pick files from local storage
                              Provider.of<PickFileService>(
                                context,
                                listen: false,
                              ).pickFileLocally(
                                description: description,
                                title: title,
                                moduleType: dropdownvalue,
                              );
                            }
                          },
                          child: const Text(
                            "Upload content ",
                            style: kloginbutton,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
