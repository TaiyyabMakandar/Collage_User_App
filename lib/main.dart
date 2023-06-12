// @dart=2.9

import 'package:collageuser/Activity/home.dart';
import 'package:collageuser/Activity/splachscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
         primarySwatch: Colors.blue,
      ),
      home:  splachScreen(),
    );
  }
}
