import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topratepppp/constant.dart';
import 'package:topratepppp/services/pickfiles/pick_files.dart';
import 'package:topratepppp/widgets/animated.dart';

class SubmitAssignment extends StatefulWidget {
  const SubmitAssignment({Key? key}) : super(key: key);
  static const id = "submit_assignment";

  @override
  _SubmitAssignmentState createState() => _SubmitAssignmentState();
}

class _SubmitAssignmentState extends State<SubmitAssignment> {
  final _formkeyGlobal = GlobalKey<FormState>();


  // Initial Selected Value
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
                              ).pickSubmitAsignmentLocally(
                                moduleType: dropdownvalue,
                              );
                            }
                          },
                          child: const Text(
                            "Submit Assignment ",
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
