import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_screen2/login.dart';
import 'package:login_screen2/neighboorhood_page.dart';
import 'package:login_screen2/ranking.dart';
import 'package:login_screen2/register_page.dart';
import 'package:login_screen2/welcome.dart';
import 'package:login_screen2/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'grid_view.dart';
import 'neighborhood_pick.dart';

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
        "/neighborhood": (context) => NeighborhoodPage(),
        "/page": (context) => Neighborhood(),
        "/gridview": (context) => ListViewDemo(),
        "/rankings": (context) => RankingsPage(),
      },
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
