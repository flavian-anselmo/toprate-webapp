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
        body: Center(
          child: SizedBox(
            width: 500,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.person,
                      size: 100,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        leading: Icon(Icons.person),
                        trailing: Text("username"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        leading: Icon(Icons.email),
                        trailing: Text("usermail@email.com"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
