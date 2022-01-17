import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topratepppp/services/chat/one_chat.dart';
import 'package:topratepppp/widgets/float_action_admin.dart';

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
      floatingActionButton: AdminButton(isVisible: isVisible),
    );
  }
}

