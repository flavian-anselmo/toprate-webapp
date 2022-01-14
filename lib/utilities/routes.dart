import 'package:flutter/material.dart';
import 'package:topratepppp/screens/addcontent/add_module_one.dart';
import 'package:topratepppp/screens/authentication/login.dart';
import 'package:topratepppp/screens/authentication/register.dart';
import 'package:topratepppp/screens/authentication/reset.dart';
import 'package:topratepppp/screens/dashboard.dart';
import 'package:topratepppp/screens/dashboard/home.dart';
import 'package:topratepppp/screens/discuss/module_one_chat.dart';
import 'package:topratepppp/screens/modules/Assignments/one_assignment.dart';
import 'package:topratepppp/screens/modules/module_five.dart';
import 'package:topratepppp/screens/modules/module_four.dart';
import 'package:topratepppp/screens/modules/module_one.dart';
import 'package:topratepppp/screens/modules/module_three.dart';
import 'package:topratepppp/screens/modules/module_two.dart';
import 'package:topratepppp/screens/splash.dart';

Map<String, WidgetBuilder> getRoutes(RouteSettings settings) {
  var routes = <String, WidgetBuilder>{

    //this are all the pages in the application
    LoginPage.id: (context) => const LoginPage(),
    SignUpPage.id: (context) => const SignUpPage(),
    ResetForgotenPassword.id: (context) => const ResetForgotenPassword(),
    Home.id: (context) => const Home(),
    DashboardScreen.id: (context) => const DashboardScreen(),

    //modules in the applications
    ModuleOne.id: (context) => const ModuleOne(),
    ModuleTwo.id: (context) => const ModuleTwo(),
    ModuleThree.id: (context) => const ModuleThree(),
    ModuleFour.id: (context) => const ModuleFour(),
    ModuleFive.id: (context) => const ModuleFive(),
    //discussions 
    Discussions.id:(context)=>const Discussions(),

    //adding content to the platform 
    AddModuleOne.id:(context)=>const AddModuleOne(),

    //assignment upload
    AssignmentUpload.id:(context)=>const AssignmentUpload(),

    //spalsh screen for the app
    SplashScreen.id: (context) => const SplashScreen(),
  };
  // if (settings.name == OrderPaymentScreen.route) {
  //   final args = settings.arguments as OrderPaymentArguments;

  //   routes.putIfAbsent(
  //     OrderPaymentScreen.route,
  //     () => (context) => OrderPaymentScreen(iPayUrl: args.iPayUrl),
  //   );
  // }

  return routes;
}