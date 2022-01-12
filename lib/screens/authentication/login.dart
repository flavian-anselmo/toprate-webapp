import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topratepppp/constant.dart';
import 'package:topratepppp/screens/authentication/register.dart';
import 'package:topratepppp/screens/authentication/reset.dart';
import 'package:topratepppp/screens/dashboard.dart';
import 'package:topratepppp/services/auth/sign_in.dart';
import 'package:topratepppp/widgets/animated.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String id = "login";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkeyGlobal = GlobalKey<FormState>();
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                          setState(() {
                            email = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "*required field";
                          } else if (value.length > 50) {
                            return "too many characters";
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
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: ktextFieldDEcoratiion.copyWith(
                          labelText: 'password',
                          prefixIcon: const Icon(Icons.password),
                          hintText: "8 characters ",
                        ),
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "*required field";
                          } else if (value.length < 6) {
                            return "password too weak";
                          }
                          return null;
                        },
                      ),
                    ),
                    //const Spacer(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    ListTile(
                      title: TextButton(
                        onPressed: () {
                          //reset the password
                          Navigator.pushNamed(
                              context, ResetForgotenPassword.id);
                        },
                        child: const Text(
                          'forgot password?',
                          style: kauthtxtbuttondecoration,
                        ),
                      ),
                      leading: TextButton(
                        onPressed: () {
                          //move to the signup screen
                          Navigator.pushNamed(context, SignUpPage.id);
                        },
                        child: const Text(
                          'don\'t have an account? Sign up',
                          style: kauthtxtbuttondecoration,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: kelevatedbutton,
                        onPressed: () async {
                          //login the user
                          if (_formkeyGlobal.currentState!.validate()) {
                            Provider.of<SignInAuth>(
                              context,
                              listen: false,
                            ).signToIgas(email, password).whenComplete(() {
                              //move to nxt screen if auth is ok else remain in thet screen
                              if (Provider.of<SignInAuth>(context,
                                          listen: false)
                                      .isLog ==
                                  true) {
                                //move to the dhaborad screen
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const DashboardScreen(),
                                  ),
                                  (route) => false,
                                );
                              } else {
                                //remain in the current screen
                                return;
                              }
                            });
                          }
                        },
                        child: const Text(
                          'Sign in',
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