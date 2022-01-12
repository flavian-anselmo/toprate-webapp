import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  static const String id = "profile";

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(300.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.person,
                size: 100,
              ),
              SizedBox(
                height: 50.0,
              ),
              SizedBox(
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.person),
                    trailing: Text("username"),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.email),
                  trailing: Text("usermail@email.com"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
