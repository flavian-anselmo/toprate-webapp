import 'package:flutter/material.dart';
import 'package:topratepppp/screens/addcontent/add_module_one.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const String id = "home";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      floatingActionButton: FloatingActionButton(
        ///this button will only be available to the admins
        child: const Icon(Icons.add),
        onPressed: () {
          //navigate to the add screen
          Navigator.pushNamed(context, AddModuleOne.id);
        },
      ),
    );
  }
}