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
      body: SafeArea(
        child: GridView.extent(
          primary: false,
          padding: const EdgeInsets.all(16),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          maxCrossAxisExtent: 200.0,
          children: <Widget>[
            InkWell(
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
                      child: Text('Leadership & Governance', style: TextStyle(fontSize: 20)),
                    )),
                color: Color.fromARGB(255, 161, 172, 196),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, ModuleTwo.id);
              },
              child: const Card(
                //padding: const EdgeInsets.all(8),
                child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Strategic Human Resource Management', style: TextStyle(fontSize: 20)),
                    )),
                color: Color.fromARGB(255, 98, 162, 214),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const Card(
                //padding: const EdgeInsets.all(8),
                child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Project management & Strategic Planning', style: TextStyle(fontSize: 20)),
                    )),
                color: Color.fromARGB(255, 98, 162, 214),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const Card(
                //padding: const EdgeInsets.all(8),
                child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Financial Mnagement', style: TextStyle(fontSize: 20)),
                    )),
                color: Color.fromARGB(255, 161, 172, 196),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const Card(
                //padding: const EdgeInsets.all(8),
                child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Digital teaching and learning', style: TextStyle(fontSize: 20)),
                    )),
                color: Color.fromARGB(255, 161, 172, 196),
              ),
            ),
          ],
        ),
      ),
    );
  }
}