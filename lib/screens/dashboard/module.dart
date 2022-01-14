import 'package:flutter/material.dart';
import 'package:topratepppp/screens/modules/module_one.dart';
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
                                'Leadership & Governance',
                                style: TextStyle(fontSize: 15),
                              ),
                            )),
                            color: Color.fromARGB(255, 161, 172, 196),
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
                                'Strategic Human Resource Management',
                                style: TextStyle(fontSize: 15),
                              ),
                            )),
                            color: Color.fromARGB(255, 98, 162, 214),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          hoverColor: Colors.cyan,
                          onTap: () {},
                          child: const Card(
                            //padding: const EdgeInsets.all(8),
                            child: Center(
                                child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Project management & Strategic Planning',
                                style: TextStyle(fontSize: 15),
                              ),
                            )),
                            color: Color.fromARGB(255, 98, 162, 214),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          hoverColor: Colors.cyan,
                          onTap: () {},
                          child: const Card(
                            //padding: const EdgeInsets.all(8),
                            child: Center(
                                child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Financial Management',
                                style: TextStyle(fontSize: 15),
                              ),
                            )),
                            color: Color.fromARGB(255, 161, 172, 196),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          hoverColor: Colors.cyan,
                          onTap: () {},
                          child: const Card(
                            //padding: const EdgeInsets.all(8),
                            child: Center(
                                child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Digital teaching and learning',
                                style: TextStyle(fontSize: 15),
                              ),
                            )),
                            color: Color.fromARGB(255, 161, 172, 196),
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
