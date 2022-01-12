import 'package:flutter/material.dart';

class ModuleTwo extends StatefulWidget {
  const ModuleTwo({Key? key}) : super(key: key);
  static const String id = "module-two";

  @override
  _ModuleTwoState createState() => _ModuleTwoState();
}

class _ModuleTwoState extends State<ModuleTwo> {
 

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(onPressed: (){}, child: const Text('data')),
    );
  }
}