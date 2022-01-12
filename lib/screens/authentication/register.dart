import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:topratepppp/constant.dart';
import 'package:topratepppp/screens/authentication/login.dart';
import 'package:topratepppp/services/auth/sign_up.dart';
import 'package:topratepppp/widgets/animated.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static const String id = "signup";

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formkeyGlobal = GlobalKey<FormState>();

  //email and password credentials
  late String email;
  late String password;
  late String name;

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
                        keyboardType: TextInputType.name,
                        decoration: ktextFieldDEcoratiion.copyWith(
                          labelText: 'User Name',
                          prefixIcon: const Icon(Icons.person),
                          hintText: "John Doe",
                        ),
                        onChanged: (value) {
                          //set the name
                          name = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "*required field";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
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
                          //set the email
                          setState(() {
                            email = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "*required field";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: ktextFieldDEcoratiion.copyWith(
                          labelText: 'Password',
                          prefixIcon: const Icon(Icons.password),
                          hintText: "must have 8 characters",
                        ),
                        onChanged: (value) {
                          //set the password
                          setState(() {
                            password = email;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "*required field";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, LoginPage.id);
                      },
                      child: const Text(
                        'Already have an account? Sign in',
                        style: kauthtxtbuttondecoration,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: kelevatedbutton,
                        onPressed: () async {
                          if (_formkeyGlobal.currentState!.validate()) {
                            Provider.of<SignUpAuth>(
                              context,
                              listen: false,
                            ).signUpToIgas(email, password).whenComplete(() {
                              if (Provider.of<SignUpAuth>(
                                    context,
                                    listen: false,
                                  ).isReg ==
                                  true) {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const LoginPage(),
                                  ),
                                  (route) => false,
                                );
                                //only move to the next screen if  valid
                                EasyLoading.showSuccess(
                                    "Registered successfully");
                              } else {
                                //return nothing due to errors
                                return;
                              }
                            });
                          }
                        },
                        child: const Text(
                          '    Sign up    ',
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
