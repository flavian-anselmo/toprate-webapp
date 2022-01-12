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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://chiefexecutive.net/wp-content/uploads/2020/11/AdobeStock_246230613.jpg',
            ),
            fit: BoxFit.cover, // -> 02
          ),
        ),
        child: Center(
          child: SizedBox(
            width: 500,
            child: Card(
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const AnimatedTxt(),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
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
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
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
                                  builder: (BuildContext context) =>
                                      const LoginPage(),
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
                    ),
                  ],
                ),
                key: _formkeyGlobal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
