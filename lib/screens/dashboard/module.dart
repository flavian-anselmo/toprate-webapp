import 'package:flutter/material.dart';
import 'package:topratepppp/constant.dart';
import 'package:topratepppp/screens/modules/module_five.dart';
import 'package:topratepppp/screens/modules/module_four.dart';
import 'package:topratepppp/screens/modules/module_one.dart';
import 'package:topratepppp/screens/modules/module_three.dart';
import 'package:topratepppp/screens/modules/module_two.dart';

class Modules extends StatefulWidget {
  const Modules({Key? key}) : super(key: key);
  static const String id = "modules";

  @override
  _ModulesState createState() => _ModulesState();
}

class _ModulesState extends State<Modules> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 50, 10, 50),
              child: Card(
                child: SafeArea(
                  child: GridView.extent(
                    primary: false,
                    padding: const EdgeInsets.all(16),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    maxCrossAxisExtent: 200.0,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          hoverColor: Colors.cyan,
                          onTap: () {
                            //move to module one content --the user should be able to downoad
                            //this contents are connected to the database
                            Navigator.pushNamed(context, ModuleOne.id);
                          },
                          child: const Card(
                            ///padding: EdgeInsets.all(8),
                            child: Center(
                                child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                kmodule1,
                                style:kmodulwidget
                              ),
                            )),
                            color: Colors.deepOrange
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          hoverColor: Colors.cyan,
                          onTap: () {
                            Navigator.pushNamed(context, ModuleTwo.id);
                          },
                          child: const Card(
                            //padding: const EdgeInsets.all(8),
                            child: Center(
                                child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                kmodule2,
                                style:kmodulwidget
                              ),
                            )),
                            color: Colors.green
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          hoverColor: Colors.cyan,
                          onTap: () {
                            Navigator.pushNamed(context, ModuleThree.id);
                          },
                          child: const Card(
                            //padding: const EdgeInsets.all(8),
                            child: Center(
                                child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                kmodule3,
                                style:kmodulwidget
                              ),
                            )),
                            color: Colors.blueGrey
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          hoverColor: Colors.cyan,
                          onTap: () {
                            Navigator.pushNamed(context, ModuleFour.id);
                          },
                          child: const Card(
                            //padding: const EdgeInsets.all(8),
                            child: Center(
                                child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                kmodule4,
                                style: kmodulwidget
                              ),
                            )),
                            color: Colors.deepPurple
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          hoverColor: Colors.cyan,
                          onTap: () {
                            Navigator.pushNamed(context, ModuleFive.id);
                          },
                          child: const Card(
                            //padding: const EdgeInsets.all(8),
                            child: Center(
                                child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                kmodule5,
                                style: kmodulwidget
                              ),
                            )),
                            color: Colors.lime
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
