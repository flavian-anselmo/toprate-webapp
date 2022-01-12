import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:topratepppp/screens/splash.dart';
import 'package:topratepppp/services/auth/forget.dart';
import 'package:topratepppp/services/auth/sign_in.dart';
import 'package:topratepppp/services/auth/sign_out.dart';
import 'package:topratepppp/services/auth/sign_up.dart';
import 'package:topratepppp/services/chat/one_chat.dart';
import 'package:topratepppp/services/firestore/download.dart';
import 'package:topratepppp/services/firestore/firestore.dart';
import 'package:topratepppp/services/pickfiles/pick_files.dart';
import 'package:topratepppp/utilities/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBPrs7OohsOS6WZbccZ2WDn4efaHV-nPHQ",
      appId: "1:382323322502:web:5ac19525a65283f607eb07",
      messagingSenderId: "382323322502",
      projectId: "toprate-test-sprint-b6032",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //providers of diffeerent types
        ChangeNotifierProvider.value(value: SignInAuth()),
        ChangeNotifierProvider.value(value: SignUpAuth()),
        ChangeNotifierProvider.value(value: SignOutAuth()),
        ChangeNotifierProvider.value(value: ResetpasswordAuth()),
        ChangeNotifierProvider.value(value: FireStoreServices()),
        ChangeNotifierProvider.value(value: DownloadContent()),
        ChangeNotifierProvider.value(value: ModuleChat()),
        ChangeNotifierProvider.value(value: PickFileService()),
      ],
      child: MaterialApp(
        builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
        title: 'Toprate',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: SplashScreen.id,
        onGenerateRoute: (settings) {
          Map<String, WidgetBuilder> routes = getRoutes(settings);
          WidgetBuilder? screen = routes[settings.name];
          // if screen exists, create route
          if (screen != null) {
            return MaterialPageRoute(builder: (context) => screen(context));
          }
          return null;
        },
      ),
    );
  }
}
// 
