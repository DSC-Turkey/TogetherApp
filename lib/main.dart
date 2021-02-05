import 'package:flutter/material.dart';
import 'package:login_screen2/login.dart';
import 'package:login_screen2/register_page.dart';
import 'package:login_screen2/welcome.dart';
import 'package:login_screen2/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => Welcome(),
        "/signup": (context) => SignUp(),
        "/login": (context) => Login(),
        "/register": (context) => Register(),
      },
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
