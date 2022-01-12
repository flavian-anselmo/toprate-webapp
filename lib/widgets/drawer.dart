import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topratepppp/constant.dart';
import 'package:topratepppp/screens/authentication/login.dart';
import 'package:topratepppp/services/auth/sign_out.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

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
                const Text(
                  'username',
                  style: ksidebarUserInfoText,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'usernameo@gmail.com',
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
            },
          ),
          //const Spacer(),
          const Divider(color: Colors.blueGrey,),
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