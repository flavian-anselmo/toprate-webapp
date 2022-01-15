import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';
import 'package:topratepppp/screens/addcontent/add_module_one.dart';
import 'package:topratepppp/screens/modules/Assignments/upload.dart';
import 'package:topratepppp/services/chat/one_chat.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const String id = "home";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    //check for the admins emails to remove the admin button
    //that is used to upload content
    checkAdminEmail();
  }

  Future<void> checkAdminEmail() async {
    Provider.of<ModuleChat>(
      context,
      listen: false,
    ).fetchCurrentUser().whenComplete(() {
      String? email =
          Provider.of<ModuleChat>(context, listen: false).loggedInUser.email;
      if (email == "flaviananselmo6@gmail.com" ||
          email == "anambiro@kibu.ac.ke" ||
          email =="maiyojulius@kibu.ac.ke" ||
          email == "jndiku@mmust.ac.ke" ||
          email == "maryngare@yahoo.com"
          ) {
        setState(() {
          isVisible = true;
        });
      } else {
        setState(() {
          isVisible = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      floatingActionButton: Visibility(
        visible: isVisible,
        child: SpeedDial(
          child: const Icon(Icons.add),
          closedForegroundColor: Colors.black,
          openForegroundColor: Colors.white,
          closedBackgroundColor: Colors.white,
          openBackgroundColor: Colors.black,
          speedDialChildren: <SpeedDialChild>[
            SpeedDialChild(
              child: const Icon(Icons.view_module),
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
              label: 'Upload Module Materials',
              onPressed: () {
                Navigator.pushNamed(context, AddModuleOne.id);
              },
              closeSpeedDialOnPressed: false,
            ),
            SpeedDialChild(
              child: const Icon(Icons.book),
              foregroundColor: Colors.black,
              backgroundColor: Colors.yellow,
              label: 'Upload Assignments',
              onPressed: () {
                Navigator.pushNamed(context, AssignmentUpload.id);
              },
            ),
            //  Your other SpeeDialChildren go here.
          ],
        ),
      ),
    );
  }
}
