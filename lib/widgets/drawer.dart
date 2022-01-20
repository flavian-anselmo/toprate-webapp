import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topratepppp/constant.dart';
import 'package:topratepppp/screens/authentication/login.dart';
import 'package:topratepppp/screens/dashboard/profile.dart';
import 'package:topratepppp/services/auth/sign_out.dart';
import 'package:topratepppp/services/chat/one_chat.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  String currentUser = "usernamame";
  String email = "user@mail.com";
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
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(color: ksecondaryAPPthemecolor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentUser,
                  style: ksidebarUserInfoText,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  email,
                  style: ksidebarUserInfoText.copyWith(
                    color: Colors.white,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text('Profile'),
            onTap: () {
              //move to the profile screem
              Navigator.pushNamed(context, Profile.id);
            },
          ),
          //const Spacer(),
          const Divider(
            color: Colors.blueGrey,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                //move to the profile screem
                Provider.of<SignOutAuth>(
                  context,
                  listen: false,
                ).signOutFromIgas().whenComplete(() {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (
                        BuildContext context,
                      ) =>
                          const LoginPage(),
                    ),
                    (route) => false,
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
