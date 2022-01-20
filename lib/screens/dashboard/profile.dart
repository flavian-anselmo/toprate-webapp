import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topratepppp/constant.dart';
import 'package:topratepppp/services/chat/one_chat.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  static const String id = "profile";

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String currentUser = "username ";
  String email = "usermail@gmail.com";
  @override
  void initState() {
    super.initState();
    fetchUserMail();
    checkAdminEmail();
  }

  Future<void> fetchUserMail() async {
    //ge the email of the user
    Provider.of<ModuleChat>(context, listen: false)
        .fetchCurrentUser()
        .whenComplete(() {
      setState(() {
        email = Provider.of<ModuleChat>(
          context,
          listen: false,
        ).loggedInUser.email!;
      });
    });
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
          currentUser = "Admin";
        });
      } else {
        setState(() {
          currentUser = "Student";
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Profile.id),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.person,
                        size: 100,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color:Colors.cyan,
                        child: ListTile(
                          leading: const Icon(Icons.person),
                          trailing: Text(currentUser,style:const TextStyle(fontSize: 20)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.amber,
                        child: ListTile(
                          leading: const Icon(Icons.email),
                          trailing: Text(email,style:const TextStyle(fontSize: 20)),
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
    );
  }
}
/**
 * task 
 * 
 * 1 .get the mail of the user ---done 
 * 
 * 2. check if the mail is for admins 
 * 
 */