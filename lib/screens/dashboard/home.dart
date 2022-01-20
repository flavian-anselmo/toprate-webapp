import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topratepppp/constant.dart';
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
      if (email == kadmin1 ||
          email == kadmin2 ||
          email == kadmin3 ||
          email == kadmin4 ||
          email == kadmin5) {
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
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://thumbs.dreamstime.com/b/e-learning-concept-illustration-flat-style-38747905.jpg',
                ),
                fit: BoxFit.cover, // -> 02
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                khomepgtxt,
                style: TextStyle(color: Colors.white, fontSize: 20,),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: AdminButton(isVisible: isVisible),
    );
  }
}
