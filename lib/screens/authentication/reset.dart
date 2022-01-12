import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topratepppp/constant.dart';
import 'package:topratepppp/screens/authentication/login.dart';
import 'package:topratepppp/services/auth/forget.dart';
import 'package:topratepppp/widgets/animated.dart';

class ResetForgotenPassword extends StatefulWidget {
  const ResetForgotenPassword({Key? key}) : super(key: key);
  static const String id = "reset";

  @override
  _ResetForgotenPasswordState createState() => _ResetForgotenPasswordState();
}

class _ResetForgotenPasswordState extends State<ResetForgotenPassword> {
  final _formkeyGlobal = GlobalKey<FormState>();
  late String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AnimatedTxt(),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: ktextFieldDEcoratiion.copyWith(
                  labelText: 'email',
                  prefixIcon: const Icon(Icons.email),
                  hintText: "steph@gmail.com",
                ),
                onChanged: (value) {
                  email = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "*required field";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  //reset password with provider and firebase
                  if (_formkeyGlobal.currentState!.validate()) {
                    Provider.of<ResetpasswordAuth>(
                      context,
                      listen: false,
                    ).resetPassword(email).whenComplete(() {
                      //navigate to the login screen
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>  const LoginPage(),
                        ),
                        (route) => false,
                      );
                    });
                  }
                },
                child: const Text(
                  'Reset',
                  style: kloginbutton,
                ),
              ),
            ],
          ),
          key: _formkeyGlobal,
        ),
      ),
    );
  }
}