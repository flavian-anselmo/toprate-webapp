import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:topratepppp/constant.dart';
import 'package:topratepppp/screens/authentication/login.dart';
import 'package:topratepppp/screens/dashboard.dart';
import 'package:topratepppp/widgets/spin.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String id = "splash";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //method to load data
    loadData();
  }

  Future<void> loadData() async {
    //check the data base to keep the user logged in
    await switchScreen();
  }

  Future<void> switchScreen() async {
    //keep the user logged into the device
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.currentUser?.reload();
    auth.userChanges().listen((User? user) {
      try {
        if (user == null) {
          //move to the login screen and pop out the splash screen
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const LoginPage(),
            ),
            (route) => false,
          );
        } else {
          //move to the home screeen and pop all the screens
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const DashboardScreen(),
            ),
            (route) => false,
          );
        }
      } catch (e) {
        EasyLoading.showError(e.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Toprate', style: ksplashtext),
            Spiner(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Toprate training', style: ksplashspacertxt),
            )
          ],
        ),
      ),
    );
  }
}